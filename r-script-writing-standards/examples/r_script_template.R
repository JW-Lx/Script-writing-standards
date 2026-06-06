# ============================================================
# Project: <project name>
# Purpose: <brief analysis goal>
# Author: <name>
# Date: <YYYY-MM-DD>
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
figure_dir <- file.path(output_dir, "figures")

dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)
dir.create(figure_dir, showWarnings = FALSE, recursive = TRUE)


# ============================================================
# 2. Prepare input data
# ============================================================

# Input files:
# - metadata.csv: sample-level information; must include sample_id and group columns.
# - feature_table.csv: numeric feature table; samples should be rows and features columns.
metadata_path <- file.path(input_dir, "metadata.csv")
feature_table_path <- file.path(input_dir, "feature_table.csv")

metadata <- read_csv(metadata_path, show_col_types = FALSE)
feature_table <- read_csv(feature_table_path, show_col_types = FALSE)

# Check that required identifiers are present before formal analysis.
stopifnot("sample_id" %in% names(metadata))
stopifnot("sample_id" %in% names(feature_table))

analysis_data <- feature_table %>%
  inner_join(metadata, by = "sample_id")


# ============================================================
# 3. Perform formal analysis
# ============================================================

# Example analysis:
# Calculate per-sample total abundance and compare it across groups.
# Replace this block with the statistical model or method required by the project.
sample_summary <- analysis_data %>%
  mutate(total_abundance = rowSums(across(where(is.numeric)), na.rm = TRUE)) %>%
  select(sample_id, group, total_abundance)

# This test is a placeholder. Replace group and formula choices according to
# the experimental design and assumptions of the final analysis.
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
write_csv(sample_summary, file.path(output_dir, "sample_total_abundance.csv"))
write_csv(group_summary, file.path(output_dir, "group_total_abundance_summary.csv"))

# Save model output as text so the statistical result can be checked later.
capture.output(
  model_summary,
  file = file.path(output_dir, "total_abundance_lm_summary.txt")
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
