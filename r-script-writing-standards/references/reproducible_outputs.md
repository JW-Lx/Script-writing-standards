# Reproducible Outputs

Use this reference when organizing outputs and reproducibility details.

## Recommended Directories

Use predictable output folders:

```r
output_dir <- "results"
table_dir <- file.path(output_dir, "tables")
figure_dir <- file.path(output_dir, "figures")
log_dir <- file.path(output_dir, "logs")

dir.create(table_dir, showWarnings = FALSE, recursive = TRUE)
dir.create(figure_dir, showWarnings = FALSE, recursive = TRUE)
dir.create(log_dir, showWarnings = FALSE, recursive = TRUE)
```

## Reproducibility Habits

Use when relevant:

- `set.seed()` for stochastic methods
- explicit package loading
- clear path variables
- comments for software/package version requirements
- `sessionInfo()` saved to a log file
- CSV/TSV exports for tables
- PDF or PNG exports for figures, depending on downstream use

## Output File Naming

Use names that describe content:

- `sample_alpha_diversity.csv`
- `group_alpha_diversity_summary.csv`
- `differential_abundance_results.csv`
- `ordination_scores.csv`
- `alpha_diversity_by_group.pdf`
- `session_info.txt`

Avoid vague names such as `result.csv`, `plot1.pdf`, or `new_output.csv`.

## Safety

For examples and drafts, do not overwrite existing files with destructive cleanup code.

Avoid code such as:

```r
unlink(output_dir, recursive = TRUE)
```

unless the user explicitly asks for a clean rerun script and understands the consequences.
