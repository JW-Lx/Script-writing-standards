---
name: r-script-writing-standards
description: Workflow-guided standards for generating, revising, reviewing, and standardizing R scripts in scientific data analysis projects. Use when Codex needs to write or audit R, .R, Rscript, or analysis pipeline code with readable stepwise structure, useful comments, restrained function use, explicit input/output organization, reproducible outputs, and researcher-friendly code style.
---

# R Script Writing Standards

Use this skill to produce R analysis scripts that are clear enough for a researcher to understand, modify, rerun, and audit later. This skill is not for building an R package by default; it is for writing readable, reproducible, easy-to-modify scientific analysis scripts.

Core position: prefer a transparent analysis pipeline over excessive abstraction. Use functions only when they make the analysis more reproducible or easier to read.

## Highest-Priority Rules

1. Do not invent input files, sample groups, metadata columns, model formulas, statistical parameters, or biological/scientific interpretations.
2. If required information is missing, ask only for the missing information before writing a formal script.
3. If the user explicitly asks for a draft with incomplete information, write a best-effort script and mark assumptions near the relevant code and in the final response.
4. Keep the pipeline order visible: packages and environment, input preparation, formal analysis, result organization, output export.
5. Use comments to explain analysis intent, key decisions, parameters, transformations, and outputs. Do not comment obvious syntax.
6. Define custom functions immediately before the step that uses them, unless the workflow requires otherwise.
7. Save outputs in predictable folders and make paths, grouping variables, model formulas, and parameters easy to modify.

## Scenario Routing

Start by identifying the user's task, then read only the relevant workflow or template.

| User request | Scenario | Read first |
|---|---|---|
| "Write an R script", "generate analysis code", "make a full R pipeline" | Draft a new R analysis script | `workflows/write-r-analysis-script.md` then `templates/r_analysis_script.R` |
| "Review this R script", "standardize/refactor this script", "make it readable" | Review or revise an existing script | `workflows/review-r-script.md` then `references/review_checklist.md` |
| "Adapt this paper method/GitHub code/reference script to my data" | Adapt reference methodology or code | `workflows/adapt-reference-code.md` |
| "Give me a template/skeleton" | Provide a reusable R script skeleton | `templates/r_analysis_script.R` and `examples/r_script_template.R` |
| The request is about one style detail only | Apply targeted style guidance | `references/r_style_rules.md` |

## General Workflow

### Step 1: Confirm Required Information

Before writing a formal script, confirm the essentials listed in `references/input_information_checklist.md`:

- input file paths and file meanings
- data structure and identifier columns
- analysis goal and expected outputs
- methods, models, parameters, and required R packages
- reference code or methodology, if any

If only one or two details are missing, ask only for those details. Do not repeat information the user already provided.

### Step 2: Choose Structure

Use the standard section order:

1. Load packages and set environment.
2. Prepare input data.
3. Perform formal analysis.
4. Organize and summarize results.
5. Save result files and export figures.

Use visible section headers:

```r
# ============================================================
# 1. Load packages and set environment
# ============================================================
```

### Step 3: Write or Revise the Script

Apply `references/r_style_rules.md`:

- use clear object names
- avoid compressed one-line expressions when multi-line code is clearer
- avoid unnecessary nesting
- keep code close to the actual analysis logic
- add comments for non-obvious analysis decisions
- use local custom functions only when they reduce meaningful repetition or clarify complex logic

For reproducibility and output organization, apply `references/reproducible_outputs.md`.

### Step 4: Self-Check Before Delivery

Before returning a script or revision, check:

- required inputs are named and explained
- sample IDs, feature IDs, grouping variables, and metadata variables are explicit
- data orientation is stated; for microbiome-style feature tables, samples are rows and taxa/features are columns unless the method requires otherwise
- all assumptions are marked
- functions are placed close to where they are used
- outputs are saved to predictable paths
- plots and tables have clear filenames
- final response lists assumptions, required input files, expected output files, and user-editable parameters

## Output Format

When using this skill, the response should preferably include:

```markdown
Completed: <script name or revision target>

Structure:
- 1. Load packages and set environment
- 2. Prepare input data
- 3. Perform formal analysis
- 4. Organize and summarize results
- 5. Save result files and export figures

Assumptions:
- ...

Required input files:
- ...

Expected output files:
- ...

User should modify:
- paths: ...
- grouping variables: ...
- model formulas: ...
- parameters: ...
```

## Resource Index

| Type | Path | Purpose |
|---|---|---|
| Workflow | `workflows/write-r-analysis-script.md` | Step-by-step process for drafting a new R analysis script |
| Workflow | `workflows/review-r-script.md` | Review and revision workflow for existing R scripts |
| Workflow | `workflows/adapt-reference-code.md` | Adapt paper methods, GitHub code, or previous scripts to current data |
| Reference | `references/input_information_checklist.md` | Required information before formal script writing |
| Reference | `references/r_style_rules.md` | Naming, comments, function placement, and readability rules |
| Reference | `references/reproducible_outputs.md` | Output folders, seeds, logs, session info, and path handling |
| Reference | `references/review_checklist.md` | Checklist for auditing existing R scripts |
| Template | `templates/r_analysis_script.R` | Reusable R analysis script skeleton |
| Example | `examples/r_script_template.R` | Concrete example script showing the preferred shape |

## Do Not Do

- Do not turn a simple analysis script into a package-like architecture unless the user asks.
- Do not hide analysis logic behind many tiny functions.
- Do not silently change statistical methods or model formulas from a reference method.
- Do not invent missing sample groups, covariates, file schemas, or biological conclusions.
- Do not overwrite existing output files in examples unless the user clearly asks for that behavior.
