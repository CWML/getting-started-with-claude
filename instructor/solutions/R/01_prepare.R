# R/01_prepare.R
# Prepare NHANES August 2021-August 2023 blood-pressure data for analysis.
# Follows docs/analysis-plan.md. Reads data/raw/ and never changes it.
#
# Input:  data/raw/DEMO_L.xpt, data/raw/BPXO_L.xpt, data/raw/BPQ_L.xpt
# Output: output/analysis_data.rds  (the analysis population, one row per person)
#         output/analysis_data.csv  (the same data, for the Data Explorer)
#         output/prep_log.csv       (every exclusion and recode, with counts)
#
# Run from the project folder: Rscript R/01_prepare.R

library(tidyverse)
library(haven)
library(here)

here::i_am("R/01_prepare.R")


# 1. Read the three CDC files, keeping only the variables in the dictionary --

read_nhanes <- function(name) {
  read_xpt(here("data", "raw", paste0(name, ".xpt")))
}

sbp_vars <- c("BPXOSY1", "BPXOSY2", "BPXOSY3")
dbp_vars <- c("BPXODI1", "BPXODI2", "BPXODI3")

demo <- read_nhanes("DEMO_L") |>
  select(SEQN, RIDSTATR, RIAGENDR, RIDAGEYR, RIDRETH3, RIDEXPRG,
         WTMEC2YR, SDMVPSU, SDMVSTRA)
bpxo <- read_nhanes("BPXO_L") |> select(SEQN, all_of(sbp_vars), all_of(dbp_vars))
bpq  <- read_nhanes("BPQ_L")  |> select(SEQN, BPQ020, BPQ150)

cat("Rows read: DEMO_L", nrow(demo), "| BPXO_L", nrow(bpxo), "| BPQ_L", nrow(bpq), "\n")

# SEQN must identify one person in each file, or the merge would duplicate rows.
stopifnot(!anyDuplicated(demo$SEQN), !anyDuplicated(bpxo$SEQN), !anyDuplicated(bpq$SEQN))


# 2. Merge on SEQN. DEMO_L has everyone, so it is the base. ------------------

merged <- demo |>
  left_join(bpxo, by = "SEQN", relationship = "one-to-one") |>
  left_join(bpq,  by = "SEQN", relationship = "one-to-one")
stopifnot(nrow(merged) == nrow(demo))


# The prep log: one row per exclusion or recode ------------------------------

prep_log <- tibble(step = character(), n_before = integer(),
                   n_after = integer(), reason = character())

log_step <- function(step, n_before, n_after, reason) {
  prep_log <<- add_row(prep_log, step = step, n_before = as.integer(n_before),
                       n_after = as.integer(n_after), reason = reason)
  cat(sprintf("%-32s %6s -> %6s  %s\n", step,
              format(n_before, big.mark = ","), format(n_after, big.mark = ","), reason))
}

log_step("merge", nrow(demo), nrow(merged),
         "All DEMO_L participants, with BPXO_L and BPQ_L joined on SEQN")


# 3. Derive mean blood pressure from the available readings 1-3 --------------

merged <- merged |>
  mutate(
    n_sbp    = rowSums(!is.na(pick(all_of(sbp_vars)))),
    n_dbp    = rowSums(!is.na(pick(all_of(dbp_vars)))),
    mean_sbp = if_else(n_sbp > 0, rowMeans(pick(all_of(sbp_vars)), na.rm = TRUE), NA_real_),
    mean_dbp = if_else(n_dbp > 0, rowMeans(pick(all_of(dbp_vars)), na.rm = TRUE), NA_real_)
  )


# 4. Apply the plan's population steps, in order ------------------------------

step_filter <- function(data, keep, step, reason) {
  out <- filter(data, {{ keep }})
  log_step(step, nrow(data), nrow(out), reason)
  out
}

analysis <- merged |>
  step_filter(RIDAGEYR >= 18, "adults",
              "Kept age 18 or older (RIDAGEYR >= 18)") |>
  step_filter(RIDSTATR == 2, "examined",
              "Kept people examined in the MEC (RIDSTATR == 2)") |>
  step_filter(n_sbp > 0 | n_dbp > 0, "has_bp_reading",
              "Kept people with at least one SBP or DBP reading") |>
  # Missing RIDEXPRG means not pregnant (men, and women outside ages 20-44).
  # `RIDEXPRG != 1` would wrongly drop everyone with a missing value.
  step_filter(!(RIDEXPRG %in% 1), "not_pregnant",
              "Dropped pregnant participants (RIDEXPRG == 1); missing counts as not pregnant")


# 5. Recode questionnaire codes 7 (refused) and 9 (don't know) to missing ----

for (v in c("BPQ020", "BPQ150")) {
  n_recode <- sum(analysis[[v]] %in% c(7, 9))
  analysis[[v]][analysis[[v]] %in% c(7, 9)] <- NA
  log_step(paste0("recode_", v), nrow(analysis), nrow(analysis),
           sprintf("Set %d values of %s coded 7 (refused) or 9 (don't know) to missing",
                   n_recode, v))
}


# 6. Medication and hypertension ---------------------------------------------

# BPQ150 is asked only if BPQ020 == 1 (ever told high blood pressure).
# Skip rule from the plan: never told (BPQ020 == 2) means not taking medication.
n_skip <- sum(is.na(analysis$BPQ150) & analysis$BPQ020 %in% 2)

analysis <- analysis |>
  mutate(
    bp_med = case_when(
      BPQ150 == 1 ~ 1,
      BPQ150 == 2 ~ 0,
      is.na(BPQ150) & BPQ020 == 2 ~ 0,   # skipped: never told, so not taking
      .default = NA_real_                 # refused, don't know, or not answered
    ),
    high_bp = (mean_sbp >= 130) %in% TRUE | (mean_dbp >= 80) %in% TRUE,
    # Hypertension: mean SBP >= 130 or mean DBP >= 80, or taking BP medication.
    # "No" needs both an SBP and a DBP reading, as in CDC's code.
    hypertension = case_when(
      high_bp | bp_med %in% 1 ~ 1,
      n_sbp > 0 & n_dbp > 0   ~ 0,
      .default = NA_real_
    ),
    sex       = factor(RIAGENDR, levels = 1:2, labels = c("Men", "Women")),
    age_group = cut(RIDAGEYR, breaks = c(17, 39, 59, Inf),
                    labels = c("18-39", "40-59", "60+"))
  )

log_step("skip_rule_bp_med", nrow(analysis), nrow(analysis),
         sprintf("Set bp_med = 0 for %d people never told they had high BP (BPQ020 == 2, BPQ150 skipped)",
                 n_skip))
log_step("missing_bp_med", nrow(analysis), nrow(analysis),
         sprintf("%d people have missing bp_med; their hypertension status comes from readings alone",
                 sum(is.na(analysis$bp_med))))
log_step("missing_hypertension", nrow(analysis), nrow(analysis),
         sprintf("%d people have missing hypertension status (not high, not on medication, no DBP or no SBP)",
                 sum(is.na(analysis$hypertension))))

stopifnot(nrow(analysis) == n_distinct(analysis$SEQN))


# 7. Save outputs -------------------------------------------------------------

analysis <- analysis |>
  select(SEQN, RIDSTATR, RIAGENDR, sex, RIDAGEYR, age_group, RIDRETH3, RIDEXPRG,
         WTMEC2YR, SDMVPSU, SDMVSTRA,
         all_of(sbp_vars), all_of(dbp_vars), n_sbp, n_dbp, mean_sbp, mean_dbp,
         BPQ020, BPQ150, bp_med, high_bp, hypertension) |>
  zap_label()

dir.create(here("output"), showWarnings = FALSE)
write_rds(analysis, here("output", "analysis_data.rds"))
write_csv(analysis, here("output", "analysis_data.csv"), na = "")
write_csv(prep_log, here("output", "prep_log.csv"))

cat("\nAnalysis population:", format(nrow(analysis), big.mark = ","), "people\n")
cat("Age 80 means 80 or older (CDC top-codes age):",
    sum(analysis$RIDAGEYR == 80), "people\n")
cat("Wrote output/analysis_data.rds, output/analysis_data.csv, output/prep_log.csv\n")
