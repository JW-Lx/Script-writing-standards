---
name: r-script-writing-standards
description: Generate, revise, review, and standardize R scripts for scientific data analysis projects. Use when Codex needs to write or audit R, .R, Rscript, or analysis pipeline code with readable stepwise structure, useful comments, restrained function use, explicit input/output organization, and reproducible results.
---

# R Script Writing Standards

## Purpose

Use this skill to produce R analysis scripts that are clear enough for a researcher to understand, modify, rerun, and audit later. Prefer readable, reproducible pipeline scripts over software-package-like abstractions.

When helpful, consult `examples/r_script_template.R` for a concrete structure, section header style, and output organization pattern.

## Before Writing

Check whether the user provided enough information to write a formal R script:

- Input files: paths, meaning of each file, row/column structure, sample IDs, feature IDs, grouping variables, and metadata variables.
- Analysis goal: what analysis should be performed and what outputs are expected.
- Methodology: statistical methods, models, parameters, software packages, or a paper Methods section.
- Reference code: prior scripts or GitHub examples to adapt to the current data structure.

If key information is missing, ask for the missing details before writing the full script. If the user explicitly requests a draft despite incomplete information, write a best-effort script and mark assumptions clearly.

## Required Pipeline

Organize scripts in this order unless the analysis workflow clearly requires otherwise:

1. Load required R packages and set up the environment.
2. Prepare input data.
3. Perform formal analysis.
4. Organize and summarize results.
5. Save result files and export figures.

Use visible section headers for every major step:

```r
# ============================================================
# 1. Load packages and set environment
# ============================================================
```

In the data preparation section, explain what each input file means and transform data into the format required by the analysis. For microbiome-style feature tables, prefer samples in rows and taxa/features in columns unless the selected method requires a different orientation.

## Function Rules

Define a function immediately before the analysis step that needs it. Do not collect all functions at the top of the script unless that ordering is necessary for the workflow.

Avoid unnecessary functions. Add a function only when it improves reproducibility, removes meaningful repeated code, or makes a complex step easier to read.

Before each custom function, add a brief comment stating:

- what the function does
- the key inputs
- the output
- why the function is needed in this step

## Commenting Style

Write comments that explain intent and analysis decisions, not obvious syntax.

- Add a short comment block before each major section explaining the section goal.
- Add concise comments for key parameters, statistical models, filtering rules, transformations, custom functions, and output files.
- Avoid commenting routine R syntax such as assignment, package loading, or simple column selection unless the line carries analysis meaning.

## Readability Style

Prioritize readability for future scientific reuse.

- Use clear object names such as `metadata`, `feature_table`, `alpha_diversity`, and `group_summary`.
- Avoid overly compressed code and complex one-line expressions.
- Avoid unnecessary nesting.
- Keep code close to the actual analysis logic.
- Prefer explicit intermediate objects when they make the analysis easier to inspect.
- Keep package loading, path setup, data checks, analysis, summaries, and exports visibly separated.

## Output Expectations

When using this skill, the response should preferably include:

- a complete R script or a clearly scoped revision
- a short explanation of the script structure
- assumptions made
- required input files
- expected output files
- notes on where the user should modify paths, grouping variables, model formulas, or parameters

## Review Checklist

When reviewing an existing R script, check:

- whether the pipeline order is clear
- whether input files and data orientation are explained
- whether comments explain analysis decisions without clutter
- whether functions are local to the steps that need them
- whether object names are readable
- whether outputs are saved in predictable folders
- whether assumptions, paths, formulas, and parameters are easy to modify
- whether the script is reproducible without becoming overly engineered
