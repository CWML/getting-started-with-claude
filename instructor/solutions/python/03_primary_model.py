# 03_primary_model.py
# Primary analysis from docs/SAP.md, section 5:
# ANCOVA of the 12-month change in SBP on arm, adjusted for baseline SBP and site.
# Input:  output/cohort_clean.csv (from 01_clean.py)
# Output: output/primary_model.csv, output/analysis_population.csv

from pathlib import Path

import pandas as pd
import statsmodels.formula.api as smf

ROOT = Path(__file__).resolve().parent.parent

cohort = pd.read_csv(ROOT / "output" / "cohort_clean.csv")

# Analysis population: complete case (non-missing baseline and 12-month SBP)
has_baseline = cohort["sbp_v0"].notna()
has_12_months = cohort["sbp_v3"].notna()
analysis_data = cohort[has_baseline & has_12_months]

population = (
    cohort.assign(
        missing_baseline=~has_baseline,
        missing_12_months=has_baseline & ~has_12_months,
        analyzed=has_baseline & has_12_months,
    )
    .groupby("arm")
    .agg(
        randomized=("patient_id", "count"),
        missing_baseline=("missing_baseline", "sum"),
        missing_12_months=("missing_12_months", "sum"),
        analyzed=("analyzed", "sum"),
        mean_change=("sbp_change", "mean"),
    )
    .loc[["Standard", "Intensive"]]
    .reset_index()
)
print(population.to_string(index=False))

# The model. Treatment('Standard') makes Standard the reference arm.
primary_model = smf.ols(
    "sbp_change ~ C(arm, Treatment('Standard')) + sbp_v0 + C(site)",
    data=analysis_data,
).fit()

ci = primary_model.conf_int()
results = pd.DataFrame({
    "term": primary_model.params.index,
    "estimate": primary_model.params.values,
    "conf.low": ci[0].values,
    "conf.high": ci[1].values,
    "p.value": primary_model.pvalues.values,
})
# Shorter names, matching the R output
results["term"] = results["term"].replace({
    "C(arm, Treatment('Standard'))[T.Intensive]": "armIntensive",
    "C(site)[T.B]": "siteB",
    "C(site)[T.C]": "siteC",
    "Intercept": "(Intercept)",
})
print(results.to_string(index=False))

# The number we care about: Intensive minus Standard
arm_effect = results[results["term"] == "armIntensive"].iloc[0]
print(f"\nn analyzed = {int(primary_model.nobs)}")
print(f"Adjusted difference (Intensive - Standard): {arm_effect['estimate']:.2f} mmHg "
      f"(95% CI {arm_effect['conf.low']:.2f} to {arm_effect['conf.high']:.2f}), "
      f"p = {arm_effect['p.value']:.2g}")

results.to_csv(ROOT / "output" / "primary_model.csv", index=False)
population.to_csv(ROOT / "output" / "analysis_population.csv", index=False)
