# tests/run_checks.R
# Runs every test in tests/testthat/ and stops with an error if any fail.
# Run from the project root: Rscript tests/run_checks.R
testthat::test_dir(here::here("tests", "testthat"), stop_on_failure = TRUE)
