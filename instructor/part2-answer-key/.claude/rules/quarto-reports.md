---
paths:
  - "reports/**/*.qmd"
---

# Quarto report rules
- Never type a number into prose. Compute it in an R chunk and use inline R: `r n_randomized`.
- Every table and figure gets a label (#tbl-, #fig-) and a caption.
- Put `set.seed()` and `sessionInfo()` in the report.
- Render with `quarto render reports/report.qmd` and fix all warnings.
