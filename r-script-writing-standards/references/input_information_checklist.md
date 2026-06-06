# Input Information Checklist

Use this checklist before drafting a formal R analysis script.

## Required Inputs

Ask for missing essentials:

- file paths for all input files
- meaning of each input file
- file format, such as CSV, TSV, XLSX, RDS, or BIOM
- sample ID column name
- feature ID column name, if applicable
- grouping variable names
- metadata variable names
- row/column orientation
- expected output tables and figures

## Analysis Goal

Confirm:

- the scientific question
- the analysis method
- the comparison groups
- whether the analysis is exploratory or confirmatory
- whether covariates, blocking factors, paired design, or repeated measures are involved

## Reference Methodology

If the user has a paper, protocol, or reference script, ask for:

- Methods text or citation
- package names and versions, if important
- model formulas or statistical tests
- filtering thresholds
- transformation or normalization rules
- figure requirements

## Drafting With Incomplete Information

If the user requests a draft before all details are known:

- write a best-effort script
- add assumptions as comments near the relevant code
- use obvious placeholders for unknown paths, columns, formulas, or parameters
- list every assumption in the final response
