# 01_clean.py
# Clean the raw class cohort and log every change.
# Input:  data/raw/class_cohort.csv (never modified)
# Output: output/cohort_clean.csv, output/cleaning_log.csv
# All data are synthetic.

from pathlib import Path

import pandas as pd

# The project root is the folder above python/
ROOT = Path(__file__).resolve().parent.parent

# Read every column as text first, so nothing is silently converted.
# Blank cells and "NA" are read as missing.
raw = pd.read_csv(ROOT / "data" / "raw" / "class_cohort.csv",
                  dtype=str, keep_default_na=False, na_values=["", "NA"])

print(f"Raw data: {len(raw)} rows, {raw['patient_id'].nunique()} unique patient IDs")

# The cleaning log: one entry per change
log_rows = []


def add_to_log(step, variable, n_changed, details):
    log_rows.append({"step": step, "variable": variable,
                     "n_changed": int(n_changed), "details": details})


# Step 1: remove exact duplicate rows ------------------------------------------
dup_ids = raw.loc[raw.duplicated(), "patient_id"].tolist()
clean = raw.drop_duplicates().reset_index(drop=True)
add_to_log("duplicates", "all", len(raw) - len(clean),
           "Removed exact duplicate rows for " + ", ".join(dup_ids))

# Check: every patient ID should now appear once
assert clean["patient_id"].is_unique


# Step 2: standardize sex to F / M ---------------------------------------------
# ASSUMPTION (confirm with the data manager): "1" = M and "2" = F.
# All numeric codes come from site C, which used a 1 = Male, 2 = Female export.
sex_map = {"F": "F", "f": "F", "Female": "F", "2": "F",
           "M": "M", "m": "M", "Male": "M", "1": "M"}
sex_before = clean["sex"].copy()
clean["sex"] = clean["sex"].map(sex_map)
for old_code in ["Female", "Male", "f", "1", "2"]:
    n_old = (sex_before == old_code).sum()
    add_to_log("sex coding", "sex", n_old, f"Recoded '{old_code}' to '{sex_map[old_code]}'")


# Step 3: convert enroll_date to a real date -----------------------------------
# Three formats are present: 2022-03-05 (ISO), 03/05/2022 (MM/DD/YYYY),
# and 05-Mar-22 (DD-Mon-YY). Parse each one with its own rule.
date_text = clean["enroll_date"]
is_iso = date_text.str.match(r"^\d{4}-\d{2}-\d{2}$")
is_us = date_text.str.match(r"^\d{2}/\d{2}/\d{4}$")
is_mon = date_text.str.match(r"^\d{2}-[A-Za-z]{3}-\d{2}$")

dates = pd.Series(pd.NaT, index=clean.index)
dates[is_iso] = pd.to_datetime(date_text[is_iso], format="%Y-%m-%d")
dates[is_us] = pd.to_datetime(date_text[is_us], format="%m/%d/%Y")
dates[is_mon] = pd.to_datetime(date_text[is_mon], format="%d-%b-%y")
clean["enroll_date"] = pd.to_datetime(dates).dt.date
add_to_log("dates", "enroll_date", is_us.sum(), "Converted MM/DD/YYYY dates to YYYY-MM-DD")
add_to_log("dates", "enroll_date", is_mon.sum(), "Converted DD-Mon-YY dates to YYYY-MM-DD")
assert clean["enroll_date"].notna().all()


# Step 4: recode sentinel missing codes (-99, 999) to missing ------------------
# The data dictionary lists -99 and 999 as missing codes for BP and labs.
bp_vars = [f"sbp_v{v}" for v in range(4)] + [f"dbp_v{v}" for v in range(4)]
lab_vars = ["ldl_mgdl", "egfr"]

for variable in lab_vars + bp_vars:
    is_code = clean[variable].isin(["-99", "999"])
    if is_code.sum() > 0:
        ids = ", ".join(clean.loc[is_code, "patient_id"])
        add_to_log("missing codes", variable, is_code.sum(), f"Set -99/999 to missing for {ids}")
    clean.loc[is_code, variable] = None


# Step 5: make numeric columns numeric -----------------------------------------
numeric_vars = ["age", "bmi", "diabetes", "ckd", "ldl_mgdl", "egfr",
                "n_bp_meds_v0"] + bp_vars + ["adverse_event"]
for variable in numeric_vars:
    clean[variable] = pd.to_numeric(clean[variable])


# Step 6: set implausible values to missing ------------------------------------
# Allowed ranges come from the data dictionary. We do not guess the "right"
# value (for example, 1200 might have been 120). We set it to missing.
allowed_ranges = {
    "age": (40, 85),
    "bmi": (18, 50),
    "ldl_mgdl": (50, 220),
    "egfr": (15, 120),
    "sbp_v0": (80, 220), "sbp_v1": (80, 220), "sbp_v2": (80, 220), "sbp_v3": (80, 220),
    "dbp_v0": (40, 130), "dbp_v1": (40, 130), "dbp_v2": (40, 130), "dbp_v3": (40, 130),
}

for variable, (lower, upper) in allowed_ranges.items():
    values = clean[variable]
    outside = values.notna() & ((values < lower) | (values > upper))
    if outside.sum() > 0:
        details = "; ".join(f"Set to missing: {pid} had {val:g}"
                            for pid, val in zip(clean.loc[outside, "patient_id"], values[outside]))
        add_to_log("implausible values", variable, outside.sum(), details)
        clean.loc[outside, variable] = None


# Step 7: note the undocumented column -----------------------------------------
# cuff_size is in the data but not in the data dictionary. Keep it, but
# don't use it until the data manager explains it.
add_to_log("undocumented column", "cuff_size", 0,
           "Not in the data dictionary. Kept but not used; ask the data manager.")


# Step 8: derive the primary outcome -------------------------------------------
clean["sbp_change"] = clean["sbp_v3"] - clean["sbp_v0"]


# Save -------------------------------------------------------------------------
(ROOT / "output").mkdir(exist_ok=True)
cleaning_log = pd.DataFrame(log_rows)
clean.to_csv(ROOT / "output" / "cohort_clean.csv", index=False)
cleaning_log.to_csv(ROOT / "output" / "cleaning_log.csv", index=False)

print(f"Clean data: {len(clean)} patients")
print(f"Patients with baseline and 12-month SBP: {clean['sbp_change'].notna().sum()}\n")
print(cleaning_log[["step", "variable", "n_changed"]].to_string())
