# tests/testthat/test-cleaning.R
# Integrity checks for the cleaned cohort written by R/01_clean.R.
# All data are synthetic.
test_that("cleaned cohort passes basic integrity checks", {
  d <- readr::read_csv(here::here("output", "cohort_clean.csv"),
                       show_col_types = FALSE)
  sbp <- unlist(d[c("sbp_v0", "sbp_v1", "sbp_v2", "sbp_v3")])

  expect_equal(nrow(d), 500)                               # 5 duplicate rows removed
  expect_equal(anyDuplicated(d$patient_id), 0)
  expect_false(any(sbp %in% c(-99, 999)))                  # missing codes recoded
  expect_true(all(sbp >= 80 & sbp <= 220, na.rm = TRUE))   # plausible range
  expect_true(all(d$sex %in% c("F", "M") | is.na(d$sex)))
})
