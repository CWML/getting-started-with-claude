# 04_figure.py
# Figure: mean SBP (95% CI) at each visit by arm, using all available data.
# Input:  output/cohort_clean.csv (from 01_clean.py)
# Output: output/fig_sbp_by_visit.png, output/sbp_by_visit.csv

from pathlib import Path

import matplotlib
matplotlib.use("Agg")  # save to file without opening a window
import matplotlib.pyplot as plt
import pandas as pd
from statsmodels.stats.weightstats import DescrStatsW

ROOT = Path(__file__).resolve().parent.parent

cohort = pd.read_csv(ROOT / "output" / "cohort_clean.csv")

# Reshape to long format: one row per patient per visit
sbp_long = cohort.melt(
    id_vars=["patient_id", "arm"],
    value_vars=["sbp_v0", "sbp_v1", "sbp_v2", "sbp_v3"],
    var_name="visit",
    value_name="sbp",
).dropna(subset=["sbp"])
sbp_long["month"] = sbp_long["visit"].map({"sbp_v0": 0, "sbp_v1": 3, "sbp_v2": 6, "sbp_v3": 12})

# Mean and 95% CI (t-based) at each visit, by arm
summary_rows = []
for (arm, month), group in sbp_long.groupby(["arm", "month"]):
    ci_lower, ci_upper = DescrStatsW(group["sbp"]).tconfint_mean()
    summary_rows.append({
        "arm": arm, "month": month, "n": len(group),
        "mean": group["sbp"].mean(), "sd": group["sbp"].std(),
        "ci_lower": ci_lower, "ci_upper": ci_upper,
    })
sbp_summary = pd.DataFrame(summary_rows)
print(sbp_summary.round(1).to_string(index=False))

# Colorblind-safe colors (blue and orange). Shift the arms slightly left and
# right so the error bars don't overlap.
arm_colors = {"Intensive": "#2a78d6", "Standard": "#eb6834"}
arm_shift = {"Intensive": -0.15, "Standard": 0.15}

fig, ax = plt.subplots(figsize=(7, 4.5))
for arm, color in arm_colors.items():
    arm_data = sbp_summary[sbp_summary["arm"] == arm]
    ax.errorbar(
        arm_data["month"] + arm_shift[arm],
        arm_data["mean"],
        yerr=[arm_data["mean"] - arm_data["ci_lower"], arm_data["ci_upper"] - arm_data["mean"]],
        color=color, marker="o", markersize=6, linewidth=2, capsize=4, label=arm,
    )

ax.set_xticks([0, 3, 6, 12])
ax.set_xlabel("Months since enrollment")
ax.set_ylabel("Systolic BP (mmHg)")
ax.set_title("Mean systolic BP by visit and arm\n"
             "Mean and 95% CI, all available data at each visit (synthetic data)",
             loc="left", fontsize=11)
ax.legend(title="Arm", frameon=False)
ax.grid(axis="y", color="#e5e5e5")
ax.spines[["top", "right"]].set_visible(False)

fig.tight_layout()
fig.savefig(ROOT / "output" / "fig_sbp_by_visit.png", dpi=300)
sbp_summary.to_csv(ROOT / "output" / "sbp_by_visit.csv", index=False)

print("Saved output/fig_sbp_by_visit.png")
