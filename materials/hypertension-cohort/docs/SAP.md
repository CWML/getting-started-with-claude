# Statistical Analysis Plan (SAP)

**Study:** Intensive vs. standard blood-pressure control in adults with hypertension (fictional class study)
**Version:** 1.0 (class teaching copy)
**Data:** `data/raw/class_cohort.csv`, described in `data/data_dictionary.csv`. **All data are synthetic.** No real patients are involved.

## 1. Design

A two-arm randomized trial at 3 sites (A, B, C). Adults aged 40–85 with hypertension were randomized about 1:1 to:

- **Intensive:** systolic BP (SBP) target below 120 mmHg
- **Standard:** SBP target below 140 mmHg

BP was measured at baseline (v0) and at 3 (v1), 6 (v2), and 12 months (v3).

## 2. Data preparation

Before analysis, the raw data are cleaned by a script and every change is logged. The raw file is never edited. Cleaning includes:

- removing duplicate records, so there is one row per `patient_id`
- recoding the missing-value codes listed in the data dictionary (`-99`, `999`, blank, `NA`) to missing
- standardizing categorical codes to the values in the data dictionary
- converting dates to ISO format (`YYYY-MM-DD`)
- setting values outside the dictionary's allowed range to missing, after they have been reviewed

Any variable in the data that is not in the dictionary is reported to the data manager and is not used in the analysis.

## 3. Analysis population

**Primary (complete case):** randomized patients with non-missing `sbp_v0` and `sbp_v3` after cleaning. Patients are analyzed in the arm they were randomized to.

Report the number randomized, the number excluded for missing baseline or 12-month SBP by arm, and the number analyzed by arm.

## 4. Primary outcome

Change in SBP from baseline to 12 months: `sbp_change = sbp_v3 − sbp_v0` (mmHg). A negative value means BP went down.

## 5. Primary analysis

ANCOVA (linear regression):

```
sbp_change ~ arm + sbp_v0 + site
```

- `arm` uses **Standard** as the reference level.
- Report the **adjusted mean difference (Intensive − Standard)** with its **95% confidence interval** and p-value.
- Two-sided alpha = 0.05.

## 6. Descriptive analyses

- **Table 1:** baseline characteristics by arm (age, sex, race/ethnicity, BMI, smoking, diabetes, CKD, LDL, eGFR, number of BP medications, baseline SBP and DBP). Continuous variables: mean (SD). Categorical variables: n (%). Show missing counts. No p-values, because baseline differences between randomized arms are due to chance.
- **Figure:** mean SBP (±95% CI) at each visit (0, 3, 6, 12 months) by arm, using all available data at each visit.
- **Safety:** number (%) with any serious adverse event, by arm.

## 7. Missing data

The primary analysis is complete case. Loss to follow-up is expected to be about 10% and may be related to age. Report the number and percent missing `sbp_v3` by arm and compare their baseline characteristics.

## 8. Planned sensitivity analyses (not yet done)

1. **Multiple imputation** of missing `sbp_v3`, using arm, site, age, sex, baseline SBP, and earlier visits.
2. **Mixed model for repeated measures** using SBP at all follow-up visits (fixed effects for arm, visit, arm × visit, baseline SBP, and site; a random intercept for patient).
3. Primary model additionally adjusted for age, sex, diabetes, and CKD.

## 9. Software

R (tidyverse) or Python (pandas, statsmodels). Every step is a script, and results are reported in a Quarto document.
