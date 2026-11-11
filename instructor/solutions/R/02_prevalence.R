# R/02_prevalence.R
# Estimate hypertension prevalence among U.S. adults, August 2021-August 2023:
# overall, by sex, and by age group, with 95% confidence intervals.
# Follows the survey design in docs/analysis-plan.md.
#
# Input:  output/analysis_data.rds (from R/01_prepare.R)
#         data/raw/DEMO_L.xpt      (design variables for everyone examined)
# Output: output/prevalence.csv
#
# Run from the project folder: Rscript R/02_prevalence.R

library(tidyverse)
library(haven)
library(survey)
library(here)

here::i_am("R/02_prevalence.R")

analysis <- read_rds(here("output", "analysis_data.rds"))


# 1. Build the design on everyone examined, then subset ----------------------
# The plan says: define the design on all examined participants (WTMEC2YR > 0)
# and then subset to the analysis population. Dropping rows before building
# the design can give wrong standard errors.

examined <- read_xpt(here("data", "raw", "DEMO_L.xpt")) |>
  filter(WTMEC2YR > 0) |>
  select(SEQN, SDMVPSU, SDMVSTRA, WTMEC2YR) |>
  zap_label()

design_data <- examined |>
  left_join(analysis |> select(SEQN, hypertension, sex, age_group),
            by = "SEQN", relationship = "one-to-one") |>
  mutate(in_analysis = SEQN %in% analysis$SEQN)

stopifnot(sum(design_data$in_analysis) == nrow(analysis))
cat("Examined participants in the design:", format(nrow(design_data), big.mark = ","), "\n")
cat("Analysis population:", format(sum(design_data$in_analysis), big.mark = ","), "\n")

design <- svydesign(ids = ~SDMVPSU, strata = ~SDMVSTRA, weights = ~WTMEC2YR,
                    nest = TRUE, data = design_data)
adults <- subset(design, in_analysis & !is.na(hypertension))


# 2. Weighted percentages with Korn-Graubard 95% CIs --------------------------

estimate <- function(dsn, group, level) {
  est <- svyciprop(~I(hypertension == 1), dsn, method = "beta")
  ci  <- confint(est)
  tibble(
    method   = "weighted (survey design)",
    group    = group,
    level    = level,
    n        = sum(weights(dsn) > 0),
    percent  = 100 * as.numeric(coef(est)),
    ci_lower = 100 * ci[1, 1],
    ci_upper = 100 * ci[1, 2]
  )
}

results <- bind_rows(
  estimate(adults, "Overall", "All adults"),
  map(levels(analysis$sex), \(s) estimate(subset(adults, sex == s), "Sex", s)),
  map(levels(analysis$age_group), \(a) estimate(subset(adults, age_group == a), "Age group", a))
)


# 3. Unweighted overall, for comparison only ---------------------------------

unweighted <- analysis |>
  filter(!is.na(hypertension)) |>
  summarise(n = n(), percent = 100 * mean(hypertension == 1)) |>
  mutate(method = "unweighted (comparison only)", group = "Overall",
         level = "All adults", ci_lower = NA_real_, ci_upper = NA_real_)

results <- bind_rows(results, unweighted) |>
  mutate(across(c(percent, ci_lower, ci_upper), \(x) round(x, 2)))


# 4. Save and show ------------------------------------------------------------

write_csv(results, here("output", "prevalence.csv"), na = "")

results |>
  mutate(estimate = if_else(is.na(ci_lower),
                            sprintf("%.1f%%", percent),
                            sprintf("%.1f%% (%.1f-%.1f)", percent, ci_lower, ci_upper))) |>
  select(method, group, level, n, estimate) |>
  print(n = 10)

cat("Wrote output/prevalence.csv\n")
