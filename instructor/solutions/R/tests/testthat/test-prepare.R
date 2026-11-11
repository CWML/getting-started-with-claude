# tests/testthat/test-prepare.R
# Checks on the analysis data written by R/01_prepare.R.
# These should FAIL on an unprepared merge of the raw files
# and PASS on output/analysis_data.rds or output/analysis_data.csv.
#
# By default the tests read output/analysis_data.rds. To point them at
# another .rds or .csv file, set CHECK_DATA (tests/run_checks.R does this
# for you):
#   Rscript tests/run_checks.R output/raw_merge.rds
#   Rscript tests/run_checks.R output/analysis_data.csv

here::i_am("tests/testthat/test-prepare.R")

data_path <- Sys.getenv("CHECK_DATA", here::here("output", "analysis_data.rds"))
d <- if (grepl("\\.csv$", data_path)) readr::read_csv(data_path, show_col_types = FALSE) else readr::read_rds(data_path)

sbp_vars <- c("BPXOSY1", "BPXOSY2", "BPXOSY3")

test_that("each person appears once (SEQN is unique)", {
  expect_equal(anyDuplicated(d$SEQN), 0)
})

test_that("the analysis population has 6,084 people, as in the plan", {
  expect_equal(nrow(d), 6084)
})

test_that("no 7 (refused) or 9 (don't know) codes remain in the BPQ variables", {
  expect_false(any(d$BPQ020 %in% c(7, 9)))
  expect_false(any(d$BPQ150 %in% c(7, 9)))
  expect_true("bp_med" %in% names(d))
  expect_true(all(d$bp_med %in% c(0, 1, NA)))
})

test_that("everyone is an adult, examined, and not pregnant", {
  expect_true(all(d$RIDAGEYR >= 18))
  expect_true(all(d$RIDSTATR == 2))
  expect_false(any(d$RIDEXPRG %in% 1))
})

test_that("mean SBP lies within each person's raw readings", {
  expect_true("mean_sbp" %in% names(d))
  readings <- as.matrix(d[sbp_vars])
  has_sbp  <- rowSums(!is.na(readings)) > 0
  low  <- apply(readings[has_sbp, , drop = FALSE], 1, min, na.rm = TRUE)
  high <- apply(readings[has_sbp, , drop = FALSE], 1, max, na.rm = TRUE)
  expect_true(all(d$mean_sbp[has_sbp] >= low & d$mean_sbp[has_sbp] <= high))
  expect_true(all(is.na(d$mean_sbp[!has_sbp])))
})

test_that("the medication skip rule is applied", {
  expect_true("bp_med" %in% names(d))
  skipped <- is.na(d$BPQ150) & d$BPQ020 %in% 2
  expect_true(all(d$bp_med[skipped] == 0))
})
