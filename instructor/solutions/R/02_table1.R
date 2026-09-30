# 02_table1.R
# Table 1: baseline characteristics by arm (see docs/SAP.md, section 6).
# Input:  output/cohort_clean.csv (from 01_clean.R)
# Output: output/table1.html, output/table1.csv

library(tidyverse)
library(here)
library(gtsummary)
library(gt)

here::i_am("R/02_table1.R")

cohort <- read_csv(here("output", "cohort_clean.csv"), show_col_types = FALSE) |>
  mutate(arm = factor(arm, levels = c("Intensive", "Standard")))

table1 <- cohort |>
  select(arm, age, sex, race_ethnicity, bmi, smoking, diabetes, ckd,
         ldl_mgdl, egfr, n_bp_meds_v0, sbp_v0, dbp_v0) |>
  tbl_summary(
    by = arm,
    type = list(n_bp_meds_v0 ~ "continuous"),
    statistic = list(all_continuous() ~ "{mean} ({sd})",
                     all_categorical() ~ "{n} ({p}%)"),
    digits = list(all_continuous() ~ 1, all_categorical() ~ c(0, 1)),
    missing_text = "Missing",
    label = list(
      age ~ "Age, years",
      sex ~ "Sex",
      race_ethnicity ~ "Race and ethnicity",
      bmi ~ "BMI, kg/m²",
      smoking ~ "Smoking",
      diabetes ~ "Diabetes",
      ckd ~ "Chronic kidney disease",
      ldl_mgdl ~ "LDL cholesterol, mg/dL",
      egfr ~ "eGFR, mL/min/1.73m²",
      n_bp_meds_v0 ~ "Number of BP medications",
      sbp_v0 ~ "Systolic BP, mmHg",
      dbp_v0 ~ "Diastolic BP, mmHg"
    )
  ) |>
  add_overall() |>
  modify_caption("**Table 1. Baseline characteristics by arm** (synthetic data)")

# No p-values: differences between randomized arms at baseline are due to chance.

table1 |>
  as_gt() |>
  gtsave(here("output", "table1.html"))

# A plain CSV copy of the same table, for the report
table1 |>
  as_tibble(col_labels = FALSE) |>
  select(Characteristic = label, Overall = stat_0, Intensive = stat_1, Standard = stat_2) |>
  write_csv(here("output", "table1.csv"), na = "")

cat("Saved output/table1.html and output/table1.csv\n")
