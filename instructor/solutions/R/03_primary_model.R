# 03_primary_model.R
# Primary analysis from docs/SAP.md, section 5:
# ANCOVA of the 12-month change in SBP on arm, adjusted for baseline SBP and site.
# Input:  output/cohort_clean.csv (from 01_clean.R)
# Output: output/primary_model.csv, output/analysis_population.csv

library(tidyverse)
library(here)
library(broom)

here::i_am("R/03_primary_model.R")

cohort <- read_csv(here("output", "cohort_clean.csv"), show_col_types = FALSE) |>
  mutate(arm = factor(arm, levels = c("Standard", "Intensive")))  # Standard = reference

# Analysis population: complete case (non-missing baseline and 12-month SBP)
analysis_data <- cohort |>
  filter(!is.na(sbp_v0), !is.na(sbp_v3))

population <- cohort |>
  group_by(arm) |>
  summarise(
    randomized        = n(),
    missing_baseline  = sum(is.na(sbp_v0)),
    missing_12_months = sum(!is.na(sbp_v0) & is.na(sbp_v3)),
    analyzed          = sum(!is.na(sbp_v0) & !is.na(sbp_v3)),
    mean_change       = mean(sbp_change, na.rm = TRUE)
  )
print(population)

# The model
primary_model <- lm(sbp_change ~ arm + sbp_v0 + site, data = analysis_data)

results <- tidy(primary_model, conf.int = TRUE) |>
  select(term, estimate, conf.low, conf.high, p.value)
print(results)

# The number we care about: Intensive minus Standard
arm_effect <- filter(results, term == "armIntensive")
cat(sprintf("\nn analyzed = %d\n", nobs(primary_model)))
cat(sprintf("Adjusted difference (Intensive - Standard): %.2f mmHg (95%% CI %.2f to %.2f), p = %.2g\n",
            arm_effect$estimate, arm_effect$conf.low, arm_effect$conf.high, arm_effect$p.value))

write_csv(results, here("output", "primary_model.csv"))
write_csv(population, here("output", "analysis_population.csv"))
