# 04_figure.R
# Figure: mean SBP (95% CI) at each visit by arm, using all available data.
# Input:  output/cohort_clean.csv (from 01_clean.R)
# Output: output/fig_sbp_by_visit.png, output/sbp_by_visit.csv

library(tidyverse)
library(here)

here::i_am("R/04_figure.R")

cohort <- read_csv(here("output", "cohort_clean.csv"), show_col_types = FALSE)

# Reshape to long format: one row per patient per visit
sbp_long <- cohort |>
  select(patient_id, arm, sbp_v0, sbp_v1, sbp_v2, sbp_v3) |>
  pivot_longer(starts_with("sbp_v"), names_to = "visit", values_to = "sbp") |>
  mutate(month = case_when(
    visit == "sbp_v0" ~ 0,
    visit == "sbp_v1" ~ 3,
    visit == "sbp_v2" ~ 6,
    visit == "sbp_v3" ~ 12
  )) |>
  filter(!is.na(sbp))

# Mean and 95% CI at each visit, by arm
sbp_summary <- sbp_long |>
  group_by(arm, month) |>
  summarise(
    n    = n(),
    mean = mean(sbp),
    sd   = sd(sbp),
    .groups = "drop"
  ) |>
  mutate(
    se       = sd / sqrt(n),
    ci_lower = mean - qt(0.975, df = n - 1) * se,
    ci_upper = mean + qt(0.975, df = n - 1) * se
  )
print(sbp_summary)

# Colorblind-safe colors (blue and orange)
arm_colors <- c(Intensive = "#2a78d6", Standard = "#eb6834")

# Shift the two arms slightly left and right so the error bars don't overlap
dodge <- position_dodge(width = 0.3)

sbp_plot <- ggplot(sbp_summary, aes(x = month, y = mean, color = arm)) +
  geom_line(linewidth = 0.8, position = dodge) +
  geom_point(size = 2.5, position = dodge) +
  geom_errorbar(aes(ymin = ci_lower, ymax = ci_upper), width = 0.3, linewidth = 0.6,
                position = dodge) +
  scale_color_manual(values = arm_colors) +
  scale_x_continuous(breaks = c(0, 3, 6, 12)) +
  labs(
    title = "Mean systolic BP by visit and arm",
    subtitle = "Mean and 95% CI, all available data at each visit (synthetic data)",
    x = "Months since enrollment",
    y = "Systolic BP (mmHg)",
    color = "Arm"
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "top", panel.grid.minor = element_blank())

ggsave(here("output", "fig_sbp_by_visit.png"), sbp_plot,
       width = 7, height = 4.5, dpi = 300, bg = "white")
write_csv(sbp_summary, here("output", "sbp_by_visit.csv"))

cat("Saved output/fig_sbp_by_visit.png\n")
