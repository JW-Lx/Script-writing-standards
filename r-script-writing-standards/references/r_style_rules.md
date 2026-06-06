# R Style Rules

These rules define the preferred writing style for scientific R analysis scripts.

## Section Structure

Use visible headers:

```r
# ============================================================
# 1. Load packages and set environment
# ============================================================
```

Keep the major sections in this order unless the method requires otherwise:

1. Load packages and set environment.
2. Prepare input data.
3. Perform formal analysis.
4. Organize and summarize results.
5. Save result files and export figures.

## Object Names

Use names that describe scientific meaning:

- `metadata`
- `feature_table`
- `analysis_data`
- `group_summary`
- `model_results`
- `alpha_diversity`
- `ordination_scores`

Avoid names such as `df1`, `tmp`, `aa`, `final2`, and `data_new_new`.

## Comments

Use comments for:

- the goal of each major step
- input file meaning
- data orientation
- filtering thresholds
- transformations
- model formulas
- key parameters
- custom functions
- output files

Avoid comments that explain obvious syntax:

```r
# Avoid
x <- 1  # assign 1 to x
```

## Function Placement

Define a custom function immediately before the step that uses it.

Before each custom function, include a short comment explaining:

- what the function does
- key inputs
- output
- why it is needed in this step

Avoid many tiny functions. The default preference is readable pipeline code.

## Readability

Prefer:

- explicit intermediate objects for important analysis stages
- multi-line pipelines when they improve clarity
- parameters named near the code that uses them
- simple control flow

Avoid:

- deeply nested expressions
- long one-line pipelines
- hidden global side effects
- broad `tryCatch` blocks that hide errors
- package-like abstraction for a simple one-off analysis
