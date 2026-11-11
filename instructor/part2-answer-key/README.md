# Part 2 answer key (instructor only)

Finished versions of the small Claude Code configuration built in *Analyzing research data with Claude Code*. They're laid out the way they sit in the demo project, so you can copy them straight in. Participants build their own in class from the prompts on `part2.qmd`; don't hand them this folder up front.

## What's here

| File | Page section | What it is |
|---|---|---|
| `.claude/settings.json` | What Claude sees, and who's in control | One rule: deny `Read(./data/restricted/**)`. Nothing else. |
| `.claude/skills/check-data/SKILL.md` | Working well, and skills | The example `check-data` skill shown on the class page. Run it with `/check-data data/raw/BPQ_L.xpt`. `disable-model-invocation: true` means Claude never starts it on its own. |

The solution scripts, tests and report are in `instructor/solutions/R/`.

## Build the demo project

Use the two demo folders in `instructor/README.md` ("Demo folders and reset"): `~/claude-class/nhanes-bp` for the live demo and `~/claude-class/nhanes-bp-tags` with the `start`, `checkpoint` and `complete` tags. Its script copies these files in. Keep one setup only, so the instructions can't drift apart.

## Show the tests fail first

Run this in the tags folder at `complete` (or any folder with the tests and outputs). The tests read `output/analysis_data.rds` by default. To show they fail on an unprepared merge, make one and point the tests at it:

```bash
Rscript -e 'library(haven); library(dplyr); rx <- function(f) read_xpt(file.path("data/raw", paste0(f, ".xpt"))); readr::write_rds(rx("DEMO_L") |> left_join(rx("BPXO_L"), by = "SEQN") |> left_join(rx("BPQ_L"), by = "SEQN"), "output/raw_merge.rds")'
Rscript tests/run_checks.R output/raw_merge.rds   # FAIL 9, PASS 5
Rscript tests/run_checks.R                        # FAIL 0, PASS 14
rm output/raw_merge.rds
```

## Requirements and checks

- **Packages:** tidyverse, haven, here, survey, testthat (and knitr for the report).
- **Manual mode in the panel:** `.claude/settings.json` can't set the panel's starting permission mode. Pick **Manual** from the mode indicator, or set `claudeCode.initialPermissionMode` to `manual` in your editor's *user* settings. The deny rule does apply in the panel.
- **The deny rule blocks Claude's Read tool, not scripts.** An R script Claude writes can still open `data/restricted/`. The real rule is: don't put restricted data in the project.
- **here():** the scripts call `here::i_am()`, so they work from the project folder with or without a `.git` folder.
- Checked on 2026-11-10 with R 4.6.0 and survey 4.5: every answer-key number in `instructor/README.md` reproduced, and the tests failed on the raw merge and passed on the prepared data.
