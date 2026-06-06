# Workflow: Adapt Reference Code or Methodology

Use this workflow when the user provides a paper Methods section, GitHub code, previous R script, or analysis description and asks to adapt it to their current data.

## Step 1: Separate Source Method From Current Data

Identify:

- what the reference method does
- required input data structure
- required packages and functions
- statistical model or algorithm
- outputs produced by the reference

Then identify the user's current data:

- file paths
- identifier columns
- metadata/grouping variables
- feature table orientation
- expected outputs

Do not copy reference code blindly. Adapt it to the current data structure.

## Step 2: Preserve Methodological Intent

Keep the core method, model, and parameters aligned with the reference unless the user requests changes.

If a change is necessary because the user's data differ from the reference, mark it explicitly:

```r
# Assumption: The reference method used paired samples, but the current data
# appear unpaired. Confirm this before interpreting the model output.
```

## Step 3: Write the Adapted Script

Use `templates/r_analysis_script.R` as the skeleton and `references/r_style_rules.md` for code style.

In the script:

- mention which input corresponds to each reference input
- state any data transformation needed before the method
- keep model formulas and key parameters easy to edit
- add comments where the adaptation differs from the reference

## Step 4: Return Adaptation Notes

Include:

- reference method summary
- current-data mapping
- assumptions and unresolved differences
- required input files
- expected output files
- user-editable parameters
