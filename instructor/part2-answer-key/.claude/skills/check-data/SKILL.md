---
name: check-data
description: Data-quality check of a CSV against the data dictionary. Run it yourself with /check-data <path-to-csv>.
disable-model-invocation: true
argument-hint: [path-to-csv]
allowed-tools: Bash(git status *)
---

## Current repository state
!`git status --short`

## Task
Check the data file $ARGUMENTS against data/data_dictionary.csv.

1. Write a script in the project's language (see CLAUDE.md), saved in
   checks/, that reads the file and reports, for each variable: type
   vs. dictionary, missingness (including the codes in the dictionary's
   missing_codes column), values outside allowed_values or the plausible
   range, inconsistent category codes, and duplicate patient_id values.
2. Run it. Fix errors and rerun.
3. Summarize problems in a table: variable, issue, n affected, example
   value. Print at most 10 rows of data.
4. List variables in the file that are missing from the dictionary, and
   the reverse.
5. Don't modify the data file. Ask me before deciding how to fix anything.
