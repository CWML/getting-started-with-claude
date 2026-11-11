# NHANES blood pressure: Claude Code practice project

This is the practice project for the class *Analyzing research data with Claude Code*. You'll use Claude Code to answer one question with real CDC survey data:

> What share of U.S. adults had hypertension in August 2021–August 2023, overall, by sex, and by age group?

You plan the work, Claude Code helps write and run the R scripts, and you check the results. At the end you compare your numbers with a published CDC estimate.

## The data

The files in `data/raw/` are public-use files from the **National Health and Nutrition Examination Survey (NHANES)**, August 2021–August 2023, run by CDC's National Center for Health Statistics (NCHS). They are real, de-identified survey data, unchanged from CDC's website.

| File | What it holds |
|---|---|
| `DEMO_L.xpt` | Demographics, exam status, survey weights and design variables |
| `BPXO_L.xpt` | Three blood-pressure readings per examined participant |
| `BPQ_L.xpt` | Questions about high blood pressure and medication |

- **Source:** CDC/NCHS. NHANES August 2021–August 2023: <https://wwwn.cdc.gov/nchs/nhanes/continuousnhanes/default.aspx?Cycle=2021-2023>
- **Citation:** Centers for Disease Control and Prevention (CDC). National Center for Health Statistics (NCHS). National Health and Nutrition Examination Survey Data. Hyattsville, MD: U.S. Department of Health and Human Services, Centers for Disease Control and Prevention, 2021–2023.
- **Terms:** CDC data are in the public domain; credit the source as "Source: CDC/NCHS." The files were downloaded on 2026-11-10; `data/raw/README.md` lists their checksums.

### NCHS data user agreement (summary)

Anyone who uses NCHS data agrees to these terms (<https://www.cdc.gov/nchs/policy/data-user-agreement.html>):

- Use the data for statistical reporting and analysis only.
- Make no attempt to learn the identity of any person in the data.
- Don't link the data with individually identifiable data from any other source.

The agreement describes legal penalties for misuse. In practice: analyze, don't identify, don't link.

### The one fictional file

`data/restricted/` holds a **fictional** stand-in for data Claude must never read. In class you block it with a permission rule and test the block. Never put real patient data, PHI or data covered by a restrictive data use agreement in this project.

## Open the project in Positron

1. Unzip the folder somewhere you can find it, such as `Documents/`. (On Windows, check that **Extract All** didn't create a folder inside a folder.)
2. In Positron, choose **File → Open Folder** and select the `nhanes-bp` folder.
3. You should see `CLAUDE.md`, `data/`, `docs/` and the other folders in the Explorer.

## Start Claude Code

- **Extension panel (what we use in class):** open any file, then click the Spark icon in the editor toolbar (top right), or click **✻ Claude Code** in the status bar (bottom right).
- **Terminal (optional):** in the **Terminal** tab, type `claude`. This needs the standalone Claude Code CLI.

Claude reads `CLAUDE.md` at the start of every conversation. It holds the project rules, such as "data/raw/ is read-only." It's advice, not a lock.

A good first prompt (in plan mode):

```text
Read docs/analysis-plan.md and data/data_dictionary.csv. Propose a
step-by-step plan to prepare the data and estimate hypertension
prevalence. List every decision you need from me. Don't write code yet.
```

## What's in the folder

```
nhanes-bp/
├── CLAUDE.md                 # project rules for Claude (advice)
├── README.md                 # this file
├── docs/
│   ├── analysis-plan.md      # the question and every decision, fixed in advance
│   └── codebooks/            # CDC codebooks for the three files (unchanged)
├── data/
│   ├── data_dictionary.csv   # the variables we use, with codes and skip rules
│   ├── raw/                  # the CDC .xpt files: read-only
│   └── restricted/           # fictional stand-in Claude must never read
├── legacy/
│   └── db511_prep_excerpt.sas  # CDC's SAS code, for an optional try-at-home exercise
├── R/                        # your numbered scripts (01_prepare.R, ...)
├── output/                   # prepared data, logs and results
└── reports/                  # optional Quarto report
```

## You'll need

R with the packages `tidyverse`, `haven`, `here`, `survey` and `testthat`, plus Positron (or VS Code) with the Claude Code extension. See the class page's setup section.

## Check the work yourself

Claude writes the code. You decide and you check. Run each script, open the results in Positron's **Data Explorer**, and make sure the numbers make sense before you trust them.
