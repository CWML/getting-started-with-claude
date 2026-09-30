/* baseline_table.sas                                              */
/* Baseline characteristics by arm for the hypertension cohort.    */
/* Written by a former analyst; not reviewed since. Synthetic data. */

proc import datafile="data/raw/class_cohort.csv"
    out=cohort dbms=csv replace;
    guessingrows=max;
run;

data cohort;
    set cohort;
    /* recode missing values */
    if sbp_v0 = -99 then sbp_v0 = .;
    if ldl_mgdl = -99 then ldl_mgdl = .;
    /* collapse sex coding */
    if sex in ("Male", "1") then sex = "M";
    if sex = "Female" then sex = "F";
    /* age groups */
    if age < 65 then age_grp = "<65";
    else age_grp = "65+";
run;

proc sort data=cohort nodupkey;
    by patient_id;
run;

proc means data=cohort n mean std maxdec=1;
    class arm;
    var age bmi sbp_v0 dbp_v0 ldl_mgdl egfr;
run;

proc freq data=cohort;
    tables (sex age_grp smoking diabetes ckd) * arm / chisq;
run;

proc ttest data=cohort;
    class arm;
    var sbp_v0;
run;
