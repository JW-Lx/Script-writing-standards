# Workflow: Write an R Analysis Script

Use this workflow when the user asks for a complete R script, R analysis pipeline, or script skeleton for scientific data analysis.

## Step 1: Confirm Missing Information

Read `references/input_information_checklist.md`.

Ask only for missing essentials. A formal script usually needs:

1. Input files and their meanings.
2. Data structure, including sample IDs, feature IDs, grouping variables, and metadata variables.
3. Analysis goal and expected outputs.
4. Statistical methods, models, parameters, and required R packages.
5. Reference code or methodology, if available.

If the user asks for a draft despite incomplete information, proceed with explicit assumptions and placeholders.

## Step 2: Choose the Script Skeleton

Read `templates/r_analysis_script.R`.

Use the standard section order:

1. Load packages and set environment.
2. Prepare input data.
3. Perform formal analysis.
4. Organize and summarize results.
5. Save result files and export figures.

Keep the script as a single readable analysis file unless the user asks for modular project code.

## Step 3: Data Preparation

Make every input file visible in code and comments.

For each input file, state:

- file path variable
- file meaning
- expected identifier column
- expected row/column orientation
- key metadata columns

For microbiome-style feature tables, prefer samples in rows and taxa/features in columns unless the selected method requires another orientation.

## Step 4: Formal Analysis

Write analysis code close to the logic of the method.

- Do not silently change the requested method.
- Make model formulas easy to find and edit.
- Name important parameters near the top of the relevant analysis section.
- Add comments for filtering thresholds, transformations, statistical models, and key assumptions.

If a custom function is needed, define it immediately before the step that uses it and include a short comment explaining what it does, inputs, output, and why it is needed.

## Step 5: Outputs and Reproducibility

Read `references/reproducible_outputs.md`.

Save:

- processed data or summaries needed for downstream checks
- model/statistical outputs
- figures with clear filenames
- session information when useful

Use predictable folders such as `results/`, `results/tables/`, `results/figures/`, and `results/logs/`.

## Step 6: Final Response

Return:

- the complete R script or target file path if edited locally
- short structure explanation
- assumptions
- required input files
- expected output files
- user-editable paths, variables, formulas, and parameters
