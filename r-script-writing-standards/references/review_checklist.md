# R Script Review Checklist

Use this checklist when auditing or revising an existing R script.

## Pipeline Structure

- [ ] The script has clear major sections.
- [ ] Package loading is separated from analysis.
- [ ] Input preparation happens before formal analysis.
- [ ] Results are summarized before export.
- [ ] Output export is easy to find.

## Input Clarity

- [ ] Each input file is named and explained.
- [ ] File paths are easy to edit.
- [ ] Sample IDs and feature IDs are explicit.
- [ ] Grouping variables and metadata variables are explicit.
- [ ] Data orientation is stated.

## Method Integrity

- [ ] Statistical tests or models are named.
- [ ] Model formulas are visible.
- [ ] Filtering thresholds are explained.
- [ ] Transformations or normalizations are explained.
- [ ] Assumptions are marked.

## Readability

- [ ] Object names are meaningful.
- [ ] Pipelines are not overly compressed.
- [ ] Nesting is reasonable.
- [ ] Repeated code is reduced without over-abstracting.
- [ ] Custom functions are placed near the step that uses them.

## Comments

- [ ] Major sections have purpose comments.
- [ ] Key parameters and outputs are explained.
- [ ] Obvious syntax is not over-commented.

## Outputs

- [ ] Tables are saved with descriptive names.
- [ ] Figures are saved with descriptive names.
- [ ] Output directories are created explicitly.
- [ ] Session information or reproducibility notes are included when useful.
