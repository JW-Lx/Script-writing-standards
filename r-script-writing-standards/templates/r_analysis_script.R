# ============================================================
# Project: <project name>
# Purpose: <brief analysis goal>
# Author: <name>
# Date: <YYYY-MM-DD>
# Notes:
#   - Replace paths, grouping variables, model formulas, and parameters.
#   - Keep assumptions visible when data details are incomplete.
# ============================================================


# ============================================================
# 1. Load packages and set environment
# ============================================================

# Load packages required for data import, manipulation, analysis, and export.
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)

set.seed(123)

input_dir <- "data"
output_dir <- "results"
table_dir <- file.path(output_dir, "tables")
figure_dir <- file.path(output_dir, "figures")
log_dir <- file.path(output_dir, "logs")

dir.create(table_dir, showWarnings = FALSE, recursive = TRUE)
dir.create(figure_dir, showWarnings = FALSE, recursive = TRUE)
dir.create(log_dir, showWarnings = FALSE, recursive = TRUE)


# ============================================================
# 2. Prepare input data
# ============================================================

# Input files:
# - metadata.csv: sample-level information; must include sample_id and group.
# - feature_table.csv: numeric feature table; samples are rows and features are columns.
metadata_path <- file.path(input_dir, "metadata.csv")
feature_table_path <- file.path(input_dir, "feature_table.csv")

metadata <- read_csv(metadata_path, show_col_types = FALSE)
feature_table <- read_csv(feature_table_path, show_col_types = FALSE)

# Check required identifiers before formal analysis.
stopifnot("sample_id" %in% names(metadata))
stopifnot("sample_id" %in% names(feature_table))
stopifnot("group" %in% names(metadata))

feature_columns <- setdiff(names(feature_table), "sample_id")

# Assumption: all non-sample_id columns in feature_table are numeric features.
# Confirm this if feature_table contains annotation columns.
stopifnot(all(vapply(feature_table[feature_columns], is.numeric, logical(1))))

analysis_data <- feature_table %>%
  inner_join(metadata, by = "sample_id")


# ============================================================
# 3. Perform formal analysis
# ============================================================

# Example analysis:
# Calculate per-sample total abundance and compare it across groups.
# Replace this block with the statistical model required by the project.
sample_summary <- feature_table %>%
  mutate(total_abundance = rowSums(across(all_of(feature_columns)), na.rm = TRUE)) %>%
  select(sample_id, total_abundance) %>%
  inner_join(metadata, by = "sample_id")

# Assumption: samples are independent and group is the main comparison variable.
# Replace this formula if the study design includes covariates or paired samples.
abundance_model <- lm(total_abundance ~ group, data = sample_summary)
model_summary <- summary(abundance_model)


# ============================================================
# 4. Organize and summarize results
# ============================================================

# Summarize total abundance by group for reporting and figure generation.
group_summary <- sample_summary %>%
  group_by(group) %>%
  summarise(
    n = n(),
    mean_total_abundance = mean(total_abundance, na.rm = TRUE),
    sd_total_abundance = sd(total_abundance, na.rm = TRUE),
    .groups = "drop"
  )


# ============================================================
# 5. Save result files and export figures
# ============================================================

# Save tabular outputs for downstream inspection.
write_csv(sample_summary, file.path(table_dir, "sample_total_abundance.csv"))
write_csv(group_summary, file.path(table_dir, "group_total_abundance_summary.csv"))

# Save model output as text so the statistical result can be checked later.
capture.output(
  model_summary,
  file = file.path(log_dir, "total_abundance_lm_summary.txt")
)

# Export a simple figure summarizing the main result.
abundance_plot <- ggplot(sample_summary, aes(x = group, y = total_abundance)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(width = 0.15, alpha = 0.7) +
  labs(
    x = "Group",
    y = "Total abundance",
    title = "Total abundance by group"
  ) +
  theme_bw()

ggsave(
  filename = file.path(figure_dir, "total_abundance_by_group.pdf"),
  plot = abundance_plot,
  width = 6,
  height = 4
)

# Save session information for reproducibility.
capture.output(
  sessionInfo(),
  file = file.path(log_dir, "session_info.txt")
)
