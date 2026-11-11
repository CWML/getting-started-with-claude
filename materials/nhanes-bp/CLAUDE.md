# NHANES blood pressure analysis

Class practice project. Real public-use CDC data: NHANES August 2021–August 2023 (files DEMO_L, BPXO_L, BPQ_L). The question and every analysis decision are in docs/analysis-plan.md. Follow it.

## Rules
- data/raw/ is READ-ONLY. Never modify, move, rename or overwrite anything there.
- Never open or read anything in data/restricted/.
- Write every analysis step as a numbered R script in R/: 01_prepare.R, 02_prevalence.R, ...
- Save every output (prepared data, logs, tables, figures) to output/, never to data/.
- Use R with tidyverse, here (for file paths), haven (to read .xpt files) and survey (for weighted estimates).
- Log every exclusion and recode: step, n before, n after, reason. Print n at each step.
- Ask me before deciding anything about missing-value codes (7, 9, blanks), survey weights or exclusions. If the plan already decides it, follow the plan and say so.
- Print at most 10 rows of data to the console.
- Don't type numbers into reports. Reports read them from output/.
- Report percentages with 95% confidence intervals. Describe; don't claim causes.

## Context
- Analysis plan: docs/analysis-plan.md
- Data dictionary (kept variables only): data/data_dictionary.csv
- CDC codebooks: docs/codebooks/ (read only the parts you need)
- Report (optional): reports/report.qmd (Quarto, renders to HTML)
