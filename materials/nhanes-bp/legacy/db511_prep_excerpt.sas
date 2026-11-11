/*****************************************************************************
  Excerpt from CDC's example code for NCHS Data Brief No. 511
  (hypertension in U.S. adults, August 2021-August 2023).

  Source: CDC/NCHS. Full program:
    https://wwwn.cdc.gov/Nchs/data/Tutorials/Code/DB511_SUDAAN.sas
  Data brief: https://www.cdc.gov/nchs/products/databriefs/db511.htm
  Downloaded 2026-11-10. U.S. government work in the public domain.

  What changed: only the lines below were kept (the data-prep step, lines
  93-131 of the original, and the subpopulation statement from the crude
  estimates, lines 188-203). The text was converted to UTF-8 with Unix
  line endings. The code itself is unchanged.

  Notes for this class:
  - The original stacks 2017-March 2020 and 2021-2023 data first, so it
    names both BPQ050A (older cycles) and BPQ150 (2021-2023). This project
    has only the 2021-2023 files.
  - This is SAS-callable SUDAAN, not R. You don't need SAS to read it.
  - Used only for an optional "try at home" exercise: explain it, or
    translate it to R, then compare with your own scripts.
*****************************************************************************/

data data_1723; set data_1723;

/*age*/
if (18 LE ridageyr LE 39) then agecat=1;
else if (40 LE ridageyr LE 59) then agecat=2;
else if ridageyr ge 60  then agecat=3;

/*htn variables*/

	/*count number of nonmissing sbp and dbp*/
	  n_sbp = n(of bpxosy1-bpxosy3);
	  n_dbp = n(of bpxodi1-bpxodi3);

	/*calculate mean sbp and dbp*/
	mean_sbp = mean(of bpxosy1-bpxosy3);
	mean_dbp = mean(of bpxodi1-bpxodi3);

	/*htn*/
	 if (mean_sbp >= 130 or mean_dbp >= 80 or bpq050a = 1 or bpq150=1) then do; htn = 1; 
	 if (mean_sbp >= 130 or mean_dbp >= 80) then htn_control = 0;
	 	else if (n_sbp > 0 and n_dbp > 0) then htn_control = 1;
	 end;
	 	else if (n_sbp > 0 and n_dbp > 0) then htn = 0;

	/*htn_aware*/
	if bpq020=1 then htn_aware=1;
	else if bpq020=2 then htn_aware=0;

	/*htn_treat*/
	if bpq050a=1 or bpq150=1 then htn_treat=1;
	else if bpq040a=2 or bpq020=2 or bpq050a=2 or bpq150=2 then htn_treat=0;

run;

/*subset 2021-2023 only*/
data data_2123;
set data_1723;
if sddsrvyr=12;
run;

/* ... (lines 132-187 omitted: age-adjusted estimates) ... */

/**** figure 1 crude estimates ****/
title "Crude prevalence of hypertension in adults age 18 and older, by sex and age: United States, August 2021–August 2023";
proc descript data=data_2123 notsorted atlevel1=1 atlevel2=2;
	nest sdmvstra sdmvpsu;
	weight wtmec2yr;
    subpopx ridageyr >=18 and ridexprg ne 1 and (n_sbp ne 0 or n_dbp ne 0); 
    class riagendr agecat /nofreq;
	var htn;
	catlevel 1;
	tables  riagendr*agecat;
	print nsum percent sepercent lowpct uppct /style=nchs percentfmt=f8.1 lowpctfmt=f8.1 uppctfmt=f8.1;
	output nsum percent sepercent atlev1 atlev2 /filename=fig1_crude replace; 
	rtitle "Crude prevalence of hypertension in adults age 18 and older, by sex and age: United States, August 2021–August 2023";
	rformat agecat agefmt.;
    rformat riagendr sex.;
run;
