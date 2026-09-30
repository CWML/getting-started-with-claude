# 02_table1.py
# Table 1: baseline characteristics by arm (see docs/SAP.md, section 6).
# Continuous: mean (SD). Categorical: n (%). Missing counts shown.
# Input:  output/cohort_clean.csv (from 01_clean.py)
# Output: output/table1.csv, output/table1.html

from pathlib import Path

import pandas as pd

ROOT = Path(__file__).resolve().parent.parent

cohort = pd.read_csv(ROOT / "output" / "cohort_clean.csv")

continuous = {
    "age": "Age, years",
    "bmi": "BMI, kg/m²",
    "ldl_mgdl": "LDL cholesterol, mg/dL",
    "egfr": "eGFR, mL/min/1.73m²",
    "n_bp_meds_v0": "Number of BP medications",
    "sbp_v0": "Systolic BP, mmHg",
    "dbp_v0": "Diastolic BP, mmHg",
}
categorical = {
    "sex": "Sex",
    "race_ethnicity": "Race and ethnicity",
    "smoking": "Smoking",
}
binary = {
    "diabetes": "Diabetes",
    "ckd": "Chronic kidney disease",
}
row_order = ["age", "sex", "race_ethnicity", "bmi", "smoking", "diabetes", "ckd",
             "ldl_mgdl", "egfr", "n_bp_meds_v0", "sbp_v0", "dbp_v0"]

# The column groups: everyone, then each arm
groups = {
    "Overall": cohort,
    "Intensive": cohort[cohort["arm"] == "Intensive"],
    "Standard": cohort[cohort["arm"] == "Standard"],
}


def mean_sd(values):
    return f"{values.mean():.1f} ({values.std():.1f})"


def n_percent(n, total):
    return f"{n} ({100 * n / total:.1f}%)"


rows = []
for variable in row_order:
    if variable in continuous:
        rows.append({"Characteristic": continuous[variable],
                     **{name: mean_sd(df[variable]) for name, df in groups.items()}})
    elif variable in binary:
        # Percent among patients with a known value
        rows.append({"Characteristic": binary[variable],
                     **{name: n_percent(int((df[variable] == 1).sum()), df[variable].notna().sum())
                        for name, df in groups.items()}})
    else:
        rows.append({"Characteristic": categorical[variable]})  # header row
        for level in sorted(cohort[variable].dropna().unique()):
            rows.append({"Characteristic": level,
                         **{name: n_percent(int((df[variable] == level).sum()), df[variable].notna().sum())
                            for name, df in groups.items()}})

    # Add a "Missing" row only if some values are missing
    if cohort[variable].isna().sum() > 0:
        rows.append({"Characteristic": "Missing",
                     **{name: str(df[variable].isna().sum()) for name, df in groups.items()}})

table1 = pd.DataFrame(rows)
table1.to_csv(ROOT / "output" / "table1.csv", index=False)
table1.fillna("").to_html(ROOT / "output" / "table1.html", index=False)

print(table1.fillna("").to_string(index=False))
