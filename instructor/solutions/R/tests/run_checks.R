# tests/run_checks.R
# Runs every test in tests/testthat/ and stops with an error if any fail.
#
# Run from the project folder:
#   Rscript tests/run_checks.R                       # checks output/analysis_data.rds
#   Rscript tests/run_checks.R output/raw_merge.rds  # checks another file
#   Rscript tests/run_checks.R output/analysis_data.csv  # .csv works too

here::i_am("tests/run_checks.R")

args <- commandArgs(trailingOnly = TRUE)
if (length(args) > 0) {
  Sys.setenv(CHECK_DATA = normalizePath(args[1], mustWork = TRUE))
}

testthat::test_dir(here::here("tests", "testthat"), stop_on_failure = TRUE)
