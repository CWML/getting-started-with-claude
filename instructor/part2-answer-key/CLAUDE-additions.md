<!--
Part 2 additions to the project's CLAUDE.md (R version).
Keep the starter CLAUDE.md's "## Rules" section as it is. Replace its "## Context"
section with the one below, and add the "## Checks" and "## Compaction" sections.
-->

## Context
- Analysis plan: @docs/SAP.md
- Data dictionary: data/data_dictionary.csv (read it when you need variable definitions)

## Checks
- After any change in R/, run `Rscript tests/run_checks.R` and show the output.
- Never edit files in tests/ unless I ask you to.

## Compaction
- When compacting, keep: the list of modified files, the n at each cleaning
  step, and every analytic decision I approved.
