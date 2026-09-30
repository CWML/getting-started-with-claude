# make_data.R
# Generates the SYNTHETIC class dataset described in instructor/README.md,
# then the Part 2 per-site "REDCap exports" made from it.
# Every value is made up. No real patients are involved.
#
# Run from the repo root:
#   Rscript instructor/make_data.R
#
# Output: materials/hypertension-cohort/data/raw/class_cohort.csv
#         materials/hypertension-cohort/data/raw/redcap/redcap_export_site_{A,B,C}.csv
#
# INSTRUCTOR ONLY. This script shows exactly which data problems are planted,
# so it is not included in the participant zip.

library(tidyverse)

set.seed(20240915) # fixed seed: the same CSV every time

n <- 500

# Helper: keep values inside a range (clean data never goes outside it)
clamp <- function(x, lower, upper) pmin(pmax(x, lower), upper)


# 1. Baseline characteristics ------------------------------------------------

cohort <- tibble(
  patient_id     = sprintf("HTN-%04d", 1:n),
  site           = sample(c("A", "B", "C"), n, replace = TRUE, prob = c(0.40, 0.35, 0.25)),
  enroll_date    = as.Date("2022-01-01") + sample(0:545, n, replace = TRUE), # up to 2023-06-30
  arm            = sample(rep(c("Intensive", "Standard"), n / 2)),            # exactly 1:1
  age            = round(clamp(rnorm(n, mean = 63, sd = 10), 40, 85)),
  sex            = sample(c("F", "M"), n, replace = TRUE, prob = c(0.52, 0.48)),
  race_ethnicity = sample(c("Asian", "Black", "Hispanic", "White", "Other/Unknown"), n,
                          replace = TRUE, prob = c(0.08, 0.24, 0.16, 0.47, 0.05)),
  bmi            = round(clamp(rnorm(n, mean = 30.5, sd = 5.5), 18, 50), 1),
  smoking        = sample(c("Never", "Former", "Current"), n, replace = TRUE,
                          prob = c(0.50, 0.35, 0.15))
)

cohort <- cohort |>
  mutate(
    # Diabetes is more common with higher BMI; CKD with older age and diabetes
    diabetes = rbinom(n, 1, plogis(-1.3 + 0.08 * (bmi - 30))),
    ckd      = rbinom(n, 1, plogis(-2.0 + 0.05 * (age - 63) + 0.6 * diabetes)),
    ldl_mgdl = round(clamp(rnorm(n, mean = 118, sd = 32), 50, 220)),
    # eGFR is lower in patients with CKD
    egfr     = if_else(ckd == 1,
                       round(clamp(rnorm(n, mean = 45, sd = 10), 15, 59)),
                       round(clamp(rnorm(n, mean = 84, sd = 14), 60, 120))),
    n_bp_meds_v0 = sample(0:4, n, replace = TRUE, prob = c(0.15, 0.30, 0.30, 0.18, 0.07))
  )


# 2. Blood pressure at baseline and follow-up --------------------------------
# Baseline SBP averages about 150. By 12 months SBP falls about 20 mmHg with
# Intensive control and about 10 mmHg with Standard control.

cohort <- cohort |>
  mutate(
    sbp_v0 = round(clamp(rnorm(n, mean = 150, sd = 12) + 0.2 * (age - 63), 120, 200)),
    dbp_v0 = round(clamp(rnorm(n, mean = 88, sd = 8) + 0.3 * (sbp_v0 - 150), 60, 115))
  )

# Average SBP drop at 3, 6, and 12 months for each arm
drop_intensive <- c(12, 17, 20)
drop_standard  <- c(6, 8, 10)

patient_effect <- rnorm(n, mean = 0, sd = 6) # some patients respond more than others
is_intensive   <- cohort$arm == "Intensive"

for (v in 1:3) {
  drop <- if_else(is_intensive, drop_intensive[v], drop_standard[v])
  # Patients who start higher tend to fall a bit more (regression to the mean)
  sbp <- cohort$sbp_v0 - drop - 0.3 * (cohort$sbp_v0 - 150) +
    patient_effect + rnorm(n, mean = 0, sd = 8)
  dbp <- cohort$dbp_v0 - drop / 2 + patient_effect / 2 + rnorm(n, mean = 0, sd = 5)
  cohort[[paste0("sbp_v", v)]] <- round(clamp(sbp, 95, 200))
  cohort[[paste0("dbp_v", v)]] <- round(clamp(dbp, 50, 115))
}

cohort <- cohort |>
  mutate(
    # Intensive control has slightly more serious adverse events
    adverse_event = rbinom(n, 1, if_else(arm == "Intensive", 0.11, 0.06)),
    # Cuff size follows BMI (this column is NOT in the data dictionary)
    cuff_size = case_when(
      bmi < 25 ~ "S",
      bmi < 35 ~ "M",
      TRUE     ~ "L"
    )
  )


# 3. Loss to follow-up -------------------------------------------------------
# About 8-10% are lost by 12 months, more often in older patients
# (missing at random given age). Once lost, all later visits are missing.

p_lost  <- plogis(-2.5 + 0.06 * (cohort$age - 63))
is_lost <- rbinom(n, 1, p_lost) == 1
first_missed_visit <- sample(1:3, n, replace = TRUE, prob = c(0.25, 0.35, 0.40))

for (v in 1:3) {
  missed <- is_lost & first_missed_visit <= v
  cohort[[paste0("sbp_v", v)]][missed] <- NA
  cohort[[paste0("dbp_v", v)]][missed] <- NA
}

# A few labs were simply not collected
cohort$ldl_mgdl[sample(n, 12)] <- NA
cohort$egfr[sample(n, 8)]      <- NA

# Put the columns in the order used in the data dictionary
cohort <- cohort |>
  select(patient_id, site, enroll_date, arm, age, sex, race_ethnicity, bmi,
         smoking, diabetes, ckd, ldl_mgdl, egfr, n_bp_meds_v0,
         sbp_v0, sbp_v1, sbp_v2, sbp_v3, dbp_v0, dbp_v1, dbp_v2, dbp_v3,
         adverse_event, cuff_size)

# Record the clean effect so the instructor can compare it with the solutions
clean_change <- cohort$sbp_v3 - cohort$sbp_v0
cat("Clean data: mean 12-month SBP change by arm\n")
print(tapply(clean_change, cohort$arm, mean, na.rm = TRUE))


# 4. Plant the data quality problems (Part 1, Exercise 1) --------------------
# From here on every column is text, so we can write messy values into it.

messy <- cohort |>
  mutate(across(everything(), as.character),
         enroll_date = format(as.Date(enroll_date), "%Y-%m-%d"))

# Helper: pick k random rows from a set of eligible rows
pick <- function(eligible, k) eligible[sample(length(eligible), k)]

# Problem 1: implausible values (data-entry slips)
messy$sbp_v1[pick(which(!is.na(messy$sbp_v1)), 1)] <- "1200"
messy$age[pick(1:n, 1)] <- "207"
messy$bmi[pick(1:n, 1)] <- "4.2"

# Problem 2: inconsistent sex coding (each step only picks rows still coded F/M)
rows <- pick(which(messy$sex %in% c("F", "M")), 18)
messy$sex[rows] <- if_else(messy$sex[rows] == "F", "Female", "Male")

# Site C's legacy export used numbers: 1 = Male, 2 = Female
rows <- pick(which(messy$sex %in% c("F", "M") & messy$site == "C"), 12)
messy$sex[rows] <- if_else(messy$sex[rows] == "F", "2", "1")

rows <- pick(which(messy$sex == "F"), 4)
messy$sex[rows] <- "f"

# Problem 3: sentinel missing codes (-99 and 999) in BP and lab fields.
# Each code replaces a real value, so the true value is lost.
plant_code <- function(data, variable, code, k) {
  has_value <- which(!is.na(data[[variable]]) & !data[[variable]] %in% c("-99", "999"))
  data[[variable]][pick(has_value, k)] <- code
  data
}
messy <- messy |>
  plant_code("sbp_v0",   "-99", 2) |>
  plant_code("sbp_v3",   "-99", 3) |>
  plant_code("sbp_v3",   "999", 2) |>
  plant_code("sbp_v2",   "999", 2) |>
  plant_code("dbp_v1",   "-99", 2) |>
  plant_code("dbp_v3",   "-99", 2) |>
  plant_code("ldl_mgdl", "-99", 3) |>
  plant_code("ldl_mgdl", "999", 2) |>
  plant_code("egfr",     "-99", 2) |>
  plant_code("egfr",     "999", 1)

# Genuinely missing values: mostly blank cells, but some say "NA"
lab_and_bp <- c("ldl_mgdl", "egfr", paste0("sbp_v", 0:3), paste0("dbp_v", 0:3))
for (variable in lab_and_bp) {
  missing_rows <- which(is.na(messy[[variable]]))
  as_text_na   <- missing_rows[seq_along(missing_rows) %% 3 == 0] # every third one
  messy[[variable]][as_text_na] <- "NA"
}

# Problem 5: mixed date formats (MM/DD/YYYY and DD-Mon-YY)
invisible(Sys.setlocale("LC_TIME", "C")) # English month names (Jan, Feb, ...)
rows <- sample(n, 40)
us_rows  <- rows[1:25]
mon_rows <- rows[26:40]
messy$enroll_date[us_rows]  <- format(cohort$enroll_date[us_rows], "%m/%d/%Y")
messy$enroll_date[mon_rows] <- format(cohort$enroll_date[mon_rows], "%d-%b-%y")

# Problem 4: 5 exact duplicate rows, inserted just after the original row
dup_rows <- sort(sample(n, 5))
row_order <- sort(c(1:n, dup_rows))
messy <- messy[row_order, ]

# Problem 6: cuff_size is already in the data but will not be in the dictionary


# 5. Write the file ----------------------------------------------------------

out_file <- "materials/hypertension-cohort/data/raw/class_cohort.csv"
write_csv(messy, out_file, na = "")
cat("Wrote", nrow(messy), "rows to", out_file, "\n")


# 6. Part 2: per-site "REDCap exports" ----------------------------------------
# Each site's export differs a little from the others, as real multi-site
# exports do, so Part 2 participants have something to harmonize.

cohort <- read_csv("materials/hypertension-cohort/data/raw/class_cohort.csv",
                   col_types = cols(.default = col_character()),
                   na = character())   # keep "", "NA", -99 exactly as they are

out_dir <- "materials/hypertension-cohort/data/raw/redcap"
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

by_site <- split(cohort, cohort$site)

# Site A: REDCap-style names (record_id, visit-labelled BP columns)
site_a <- by_site$A |>
  rename(record_id = patient_id,
         sbp_baseline = sbp_v0, sbp_3m = sbp_v1, sbp_6m = sbp_v2, sbp_12m = sbp_v3,
         dbp_baseline = dbp_v0, dbp_3m = dbp_v1, dbp_6m = dbp_v2, dbp_12m = dbp_v3)

# Site B: radio buttons exported as codes (arm 1 = Intensive, 2 = Standard;
# sex 1 = M, 2 = F), and blank labs exported as -99
site_b <- by_site$B |>
  mutate(arm = recode(arm, Intensive = "1", Standard = "2"),
         sex = recode(sex, M = "1", Male = "1", F = "2", Female = "2", f = "2"),
         across(c(ldl_mgdl, egfr), \(x) if_else(x %in% c("", "NA"), "-99", x)))

# Site C: US-style dates, a renamed column, and REDCap's data access group
site_c <- by_site$C |>
  mutate(enroll_date = format(parse_date_time(enroll_date,
                                              c("Ymd", "mdY", "dbY", "dby")),
                              "%m/%d/%Y"),
         enroll_date = replace_na(enroll_date, "")) |>
  rename(smoking_status = smoking) |>
  mutate(redcap_data_access_group = "site_c", .after = patient_id)

write_csv(site_a, file.path(out_dir, "redcap_export_site_A.csv"), na = "")
write_csv(site_b, file.path(out_dir, "redcap_export_site_B.csv"), na = "")
write_csv(site_c, file.path(out_dir, "redcap_export_site_C.csv"), na = "")

cat("Wrote", nrow(site_a), "+", nrow(site_b), "+", nrow(site_c), "rows to", out_dir, "\n")
