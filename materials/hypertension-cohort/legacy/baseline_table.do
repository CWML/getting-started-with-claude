* baseline_table.do
* Baseline characteristics by arm for the hypertension cohort.
* Written by a former analyst; not reviewed since. Synthetic data.

import delimited "data/raw/class_cohort.csv", clear varnames(1)

* recode missing values
foreach v of varlist sbp_v0 dbp_v0 ldl_mgdl egfr {
    replace `v' = . if `v' == -99
}

* keep patients with complete follow-up
drop if missing(sbp_v3)

duplicates drop patient_id, force

* collapse sex coding
replace sex = "M" if inlist(sex, "Male", "1")
replace sex = "F" if inlist(sex, "Female", "f", "2")

* Table 1
tabstat age bmi sbp_v0 dbp_v0 ldl_mgdl egfr, by(arm) stat(n mean sd) format(%6.1f)
tab sex arm, col chi2
tab smoking arm, col chi2
tab diabetes arm, col chi2
ttest sbp_v0, by(arm)
