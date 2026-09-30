---
name: table1
description: Builds a journal-ready Table 1 (baseline characteristics by group) in R with gtsummary, following this project's reporting conventions. Use when the user asks for a Table 1, a baseline characteristics table, or a descriptive table by treatment arm or another group.
argument-hint: [grouping-variable]
allowed-tools: Bash(Rscript R/*)
---

# Journal-ready Table 1

Stratify by the grouping variable in $ARGUMENTS. If none is given, use `arm`.

## Steps
1. Read docs/SAP.md and data/data_dictionary.csv. Use only the baseline
   variables the SAP lists for Table 1. If that's unclear, ask.
2. Write or update R/02_table1.R. Read the cleaned data from
   output/cohort_clean.csv (made by R/01_clean.R), never from data/raw/.
3. Build the table with gtsummary::tbl_summary(), following
   [conventions.md](conventions.md).
4. Run `Rscript R/02_table1.R`. Fix errors and rerun until it succeeds.
5. Save output/table1.docx and output/table1.html.
6. Report as evidence: N per group, rows excluded and why, the summary
   statistic used for each variable, and the console output.

## Rules
- In an RCT, don't add p-values for baseline characteristics unless the
  SAP asks for them.
- Show missing values as a separate "Missing" row; never drop them silently.
- Use variable labels from the data dictionary's label column.
