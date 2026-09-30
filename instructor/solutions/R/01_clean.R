# 01_clean.R
# Clean the raw class cohort and log every change.
# Input:  data/raw/class_cohort.csv (never modified)
# Output: output/cohort_clean.csv, output/cleaning_log.csv
# All data are synthetic.

library(tidyverse)
library(here)

here::i_am("R/01_clean.R")

# Read every column as text first, so nothing is silently converted.
# Blank cells and "NA" are read as missing.
raw <- read_csv(here("data", "raw", "class_cohort.csv"),
                col_types = cols(.default = col_character()),
                na = c("", "NA"))

cat("Raw data:", nrow(raw), "rows,", n_distinct(raw$patient_id), "unique patient IDs\n")

# The cleaning log: one row per change
cleaning_log <- tibble(step = character(), variable = character(),
                       n_changed = integer(), details = character())

add_to_log <- function(step, variable, n_changed, details) {
  cleaning_log <<- add_row(cleaning_log, step = step, variable = variable,
                           n_changed = as.integer(n_changed), details = details)
}


# Step 1: remove exact duplicate rows ----------------------------------------
dup_ids <- raw$patient_id[duplicated(raw)]
clean <- distinct(raw)
add_to_log("duplicates", "all", nrow(raw) - nrow(clean),
           paste("Removed exact duplicate rows for", paste(dup_ids, collapse = ", ")))

# Check: every patient ID should now appear once
stopifnot(n_distinct(clean$patient_id) == nrow(clean))


# Step 2: standardize sex to F / M -------------------------------------------
# ASSUMPTION (confirm with the data manager): "1" = M and "2" = F.
# All numeric codes come from site C, which used a 1 = Male, 2 = Female export.
sex_before <- clean$sex
clean <- clean |>
  mutate(sex = case_when(
    sex %in% c("F", "f", "Female") ~ "F",
    sex %in% c("M", "m", "Male")   ~ "M",
    sex == "2" ~ "F",
    sex == "1" ~ "M",
    TRUE ~ NA_character_
  ))
for (old_code in c("Female", "Male", "f", "1", "2")) {
  n_old <- sum(sex_before == old_code, na.rm = TRUE)
  add_to_log("sex coding", "sex", n_old,
             paste0("Recoded '", old_code, "' to '", clean$sex[which(sex_before == old_code)[1]], "'"))
}


# Step 3: convert enroll_date to a real date ---------------------------------
# Three formats are present: 2022-03-05 (ISO), 03/05/2022 (MM/DD/YYYY),
# and 05-Mar-22 (DD-Mon-YY). Parse each one with its own rule.
date_text <- clean$enroll_date
is_iso <- str_detect(date_text, "^[0-9]{4}-[0-9]{2}-[0-9]{2}$")
is_us  <- str_detect(date_text, "^[0-9]{2}/[0-9]{2}/[0-9]{4}$")
is_mon <- str_detect(date_text, "^[0-9]{2}-[A-Za-z]{3}-[0-9]{2}$")

clean <- clean |>
  mutate(enroll_date = case_when(
    is_iso ~ ymd(date_text, quiet = TRUE),
    is_us  ~ mdy(date_text, quiet = TRUE),
    is_mon ~ dmy(date_text, quiet = TRUE)
  ))
add_to_log("dates", "enroll_date", sum(is_us), "Converted MM/DD/YYYY dates to YYYY-MM-DD")
add_to_log("dates", "enroll_date", sum(is_mon), "Converted DD-Mon-YY dates to YYYY-MM-DD")
stopifnot(!any(is.na(clean$enroll_date)))


# Step 4: recode sentinel missing codes (-99, 999) to NA ---------------------
# The data dictionary lists -99 and 999 as missing codes for BP and labs.
bp_vars  <- c(paste0("sbp_v", 0:3), paste0("dbp_v", 0:3))
lab_vars <- c("ldl_mgdl", "egfr")

for (variable in c(lab_vars, bp_vars)) {
  is_code <- clean[[variable]] %in% c("-99", "999")
  if (sum(is_code) > 0) {
    add_to_log("missing codes", variable, sum(is_code),
               paste("Set -99/999 to missing for", paste(clean$patient_id[is_code], collapse = ", ")))
  }
  clean[[variable]][is_code] <- NA
}


# Step 5: make numeric columns numeric ---------------------------------------
numeric_vars <- c("age", "bmi", "diabetes", "ckd", "ldl_mgdl", "egfr",
                  "n_bp_meds_v0", bp_vars, "adverse_event")
clean <- clean |>
  mutate(across(all_of(numeric_vars), as.numeric))


# Step 6: set implausible values to NA ---------------------------------------
# Allowed ranges come from the data dictionary. We do not guess the "right"
# value (for example, 1200 might have been 120). We set it to missing.
allowed_ranges <- tribble(
  ~variable,  ~lower, ~upper,
  "age",          40,     85,
  "bmi",          18,     50,
  "ldl_mgdl",     50,    220,
  "egfr",         15,    120,
  "sbp_v0",       80,    220,
  "sbp_v1",       80,    220,
  "sbp_v2",       80,    220,
  "sbp_v3",       80,    220,
  "dbp_v0",       40,    130,
  "dbp_v1",       40,    130,
  "dbp_v2",       40,    130,
  "dbp_v3",       40,    130
)

for (i in seq_len(nrow(allowed_ranges))) {
  variable <- allowed_ranges$variable[i]
  values   <- clean[[variable]]
  outside  <- !is.na(values) &
    (values < allowed_ranges$lower[i] | values > allowed_ranges$upper[i])
  if (sum(outside) > 0) {
    add_to_log("implausible values", variable, sum(outside),
               paste0("Set to missing: ", clean$patient_id[outside], " had ", values[outside],
                      collapse = "; "))
    clean[[variable]][outside] <- NA
  }
}


# Step 7: note the undocumented column ---------------------------------------
# cuff_size is in the data but not in the data dictionary. Keep it, but
# don't use it until the data manager explains it.
add_to_log("undocumented column", "cuff_size", 0,
           "Not in the data dictionary. Kept but not used; ask the data manager.")


# Step 8: derive the primary outcome -----------------------------------------
clean <- clean |>
  mutate(
    arm = factor(arm, levels = c("Standard", "Intensive")),
    sbp_change = sbp_v3 - sbp_v0
  )


# Save -----------------------------------------------------------------------
dir.create(here("output"), showWarnings = FALSE)
write_csv(clean, here("output", "cohort_clean.csv"), na = "")
write_csv(cleaning_log, here("output", "cleaning_log.csv"))

cat("Clean data:", nrow(clean), "patients\n")
cat("Patients with baseline and 12-month SBP:", sum(!is.na(clean$sbp_change)), "\n\n")
print(select(cleaning_log, step, variable, n_changed), n = Inf)
