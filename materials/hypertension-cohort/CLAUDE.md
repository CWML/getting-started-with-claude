# Hypertension Cohort Analysis

Synthetic data for a class. Two-arm trial of intensive vs. standard BP control.

## Rules
- data/raw/ is READ-ONLY. Never modify, move, or overwrite raw data.
- Never open or read anything in data/restricted/ (a stand-in for data you may not share).
- Write every analysis step as a script in R/, numbered: 01_clean.R, 02_table1.R, ...
- Save outputs (cleaned data, tables, figures) to output/, never to data/.
- Use R with the tidyverse. Use {here} for file paths.
- Log every change the cleaning script makes to the data.
- Before choosing how to handle missing data or outliers, ask me.
- Don't print more than 10 rows of data to the console.
- The report is reports/report.qmd (Quarto, renders to HTML).

## Context
- Data dictionary: data/data_dictionary.csv
- Analysis plan: docs/SAP.md
