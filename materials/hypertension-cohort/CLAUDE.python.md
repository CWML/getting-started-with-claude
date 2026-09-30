> Python version of CLAUDE.md. To use Python, rename this file to CLAUDE.md and delete the R version. (If this file is already named CLAUDE.md, that is done.)

# Hypertension Cohort Analysis

Synthetic data for a class. Two-arm trial of intensive vs. standard BP control.

## Rules
- data/raw/ is READ-ONLY. Never modify, move, or overwrite raw data.
- Never open or read anything in data/restricted/ (a stand-in for data you may not share).
- Write every analysis step as a script in python/, numbered: 01_clean.py, 02_table1.py, ...
- Save outputs (cleaned data, tables, figures) to output/, never to data/.
- Use Python with pandas, statsmodels, and matplotlib. Build file paths from the project root with pathlib.
- Log every change the cleaning script makes to the data.
- Before choosing how to handle missing data or outliers, ask me.
- Don't print more than 10 rows of data to the console.
- The report is reports/report.qmd (Quarto with the Jupyter engine, renders to HTML).

## Context
- Data dictionary: data/data_dictionary.csv
- Analysis plan: docs/SAP.md
