# Workflow: Review or Standardize an Existing R Script

Use this workflow when the user provides an R script and asks for review, cleanup, standardization, readability improvement, or reproducibility improvement.

## Step 1: Identify Review Scope

Determine whether the user wants:

- a review report only
- a revised script
- both a revised script and a summary of changes

If the request is ambiguous, default to a concise review plus a revised script when local editing is possible.

## Step 2: Inspect Current Script

Read the whole script before editing.

Map the current code into these sections:

1. Load packages and set environment.
2. Prepare input data.
3. Perform formal analysis.
4. Organize and summarize results.
5. Save result files and export figures.

If code is missing a section, do not invent analysis logic. Add a clear placeholder or ask for the missing information.

## Step 3: Apply the Review Checklist

Read `references/review_checklist.md` and `references/r_style_rules.md`.

Check for:

- unclear file paths or unexplained input files
- unclear data orientation
- missing sample ID, feature ID, or grouping variable assumptions
- excessive functions or functions placed far from use
- comments that are too sparse or too obvious
- compressed code that hides logic
- output files that are not saved or not named predictably
- fragile hard-coded parameters

## Step 4: Revise Safely

Preserve the user's analysis method unless they explicitly ask to change it.

Do:

- reorder code into readable sections
- rename objects only when it improves clarity and does not break logic
- move custom functions close to use
- add concise comments for analysis decisions
- make paths and output folders explicit

Do not:

- change statistical models without calling it out
- remove user-specific parameters without asking
- add large abstractions or package structure

## Step 5: Deliver

Return:

- findings or summary of issues
- what changed
- remaining assumptions or information gaps
- expected input and output files
- whether the revised script was run or only reviewed statically
