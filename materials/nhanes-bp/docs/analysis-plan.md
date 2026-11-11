# Analysis plan: hypertension among U.S. adults, 2021–2023

Written before any analysis. Every decision below is fixed in advance. If something comes up that this plan doesn't cover, stop and decide it as a person, then add it here.

## Question

What share of U.S. adults had hypertension in August 2021–August 2023, overall, by sex, and by age group (18–39, 40–59, 60 and older)?

This is descriptive. No causal claims. No regression.

## Data

NHANES August 2021–August 2023 public-use files in `data/raw/`: `DEMO_L.xpt`, `BPXO_L.xpt`, `BPQ_L.xpt`. Merge them on `SEQN`, starting from `DEMO_L` (it has every participant). Variables are described in `data/data_dictionary.csv`.

## Population

Apply these steps in this order, and report n after each one:

| Step | Rule | Expected n |
|---|---|---|
| 1. Adults | `RIDAGEYR >= 18` | 8,153 |
| 2. Examined | `RIDSTATR == 2` (interviewed and examined) | 6,337 |
| 3. Has a reading | at least one systolic (SBP) or diastolic (DBP) reading | 6,123 |
| 4. Not pregnant | drop `RIDEXPRG == 1`; a missing `RIDEXPRG` counts as not pregnant | 6,084 |

`RIDEXPRG` is released only for women age 20–44, so most adults have it missing. Missing does not mean pregnant.

## Derived variables

- **Mean SBP and mean DBP:** the average of the available readings 1–3 (one, two or three). Missing only if all three are missing.
- **Questionnaire codes:** in `BPQ020` and `BPQ150`, 7 (refused) and 9 (don't know) are missing values.
- **Taking BP medication:** yes if `BPQ150 == 1`; no if `BPQ150 == 2`. `BPQ150` is skipped (blank) when `BPQ020 == 2` (never told they had high blood pressure): count those people as **not** taking medication. Anyone else with a blank or 7/9 is missing.
- **Hypertension:** yes if mean SBP ≥ 130 mmHg **or** mean DBP ≥ 80 mmHg **or** taking BP medication. No if none of these is true and the person has at least one SBP and one DBP reading. A missing medication answer does not make hypertension missing; the readings decide. (This matches CDC's published code.)
- **Age group:** 18–39, 40–59, 60+. Age is top-coded: `RIDAGEYR == 80` means 80 or older. Keep those people; they belong in 60+.
- **Sex:** `RIAGENDR` 1 = men, 2 = women.

## Survey design

NHANES is a complex survey. Some groups were sampled more heavily than others, so unweighted percentages don't describe U.S. adults.

```r
design <- svydesign(ids = ~SDMVPSU, strata = ~SDMVSTRA, weights = ~WTMEC2YR,
                    nest = TRUE, data = <all examined participants, WTMEC2YR > 0>)
adults <- subset(design, <in the analysis population>)
```

- Use the **exam weight** `WTMEC2YR`, not the interview weight `WTINT2YR`: blood pressure comes from the exam.
- Build the design on **all examined participants**, then `subset()` to the analysis population. Don't drop rows before building the design.
- Percentages with Korn–Graubard 95% confidence intervals: `svyciprop(..., method = "beta")`.

## What to report

- Weighted percent with hypertension (95% CI) overall, by sex, and by age group, with the unweighted n for each.
- The unweighted overall percent, labeled as a comparison only, not as an estimate for U.S. adults.
- Numbers to one decimal place, read from `output/`, never typed by hand.
- Wording: "an estimated X% of U.S. adults had hypertension." Not "being older causes hypertension."
- After your scripts run, compare with the published CDC estimate (the class page links to it).

## Out of scope

Trends over time. Combining this cycle with earlier ones (CDC warns against combining it with 2017–March 2020). Causal claims. Regression. Age adjustment (a "try at home" extra).

Source: CDC/NCHS, National Health and Nutrition Examination Survey.
