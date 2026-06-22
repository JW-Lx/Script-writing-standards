---
name: script-forge
description: Create, revise, and audit high-readability scientific analysis scripts, especially R scripts, with a concise pre-work checklist, clear goal/workflow/output header, Step-based sections, concise comments, explicit paths, and maintainable researcher-facing style. Use when the user asks for R scripts, analysis scripts, script style standardization, or wants the current readable script style reused while avoiding redundant exploratory code in final scripts.
---

# Script Forge

Use this skill to write analysis scripts that a researcher can reopen months later and still understand quickly.

## Core Promise

Produce scripts that are clear, runnable, and easy to maintain. Prefer a mostly linear analysis script over a framework-like design unless repeated logic truly needs a helper function.

## Before Writing

When files or previous scripts are available, inspect the real inputs before writing final code. Confirm the object names, key columns, sample orientation, factor levels, and expected output folder when those details affect the script.

State assumptions when they matter. If a statistical reference level, formula, or biological interpretation is ambiguous, ask or write the assumption clearly in the script comments.

For a new analysis script, provide a concise work checklist before implementation unless the user explicitly asks to skip it. Use exactly these four parts:

1. **分析目标** - restate what the script should accomplish.
2. **输入数据** - list provided inputs with paths; mark missing or uncertain inputs clearly.
3. **结果输出** - list planned output files and include output paths.
4. **需要确认信息** - ask only the decisions needed before coding.

Keep this checklist short and review-oriented. Its purpose is to let the user confirm the work before the script is written.

## Default Script Shape

Start each analysis script with a compact comment block:

```r
# ============================================================
# 目标
#   - ...
#
# 流程
#   1. ...
#   2. ...
#   3. ...
#
# 结果文件
#   - ...
#
# 说明
#   - ...
# ============================================================
```

After the header, use this order by default:

1. Load packages.
2. Define input and output paths.
3. Load or read input data.
4. Run the analysis in numbered Step sections.
5. Save result files.
6. Print a concise completion summary.

## Step Sections

Organize formal code with visible section dividers:

```r
# ---------- Step 1: 读取输入文件 ----------

# 读取本次分析需要的 RData 或表格文件，并确认对象已经进入环境。
load(input_rdata)
```

Each Step should include short comments below the heading. Comments should explain the purpose of the block, not restate obvious syntax.

## R Analysis Style

Use explicit paths and object names. For user-provided Windows paths, preserve the original path text unless a normalized path is necessary.

Keep the script readable:

- Prefer direct `load(...)`, `read.delim(...)`, `save(...)`, and `write.table(...)` calls when they are sufficient.
- Use small helper functions only for repeated checks or repeated transformations.
- Avoid adding general-purpose configuration systems unless the user asks.
- Use exploratory checks while inspecting data, but do not carry redundant exploratory branches into the final script after the real structure is known.
- Write final scripts with the confirmed object names, ID columns, grouping variables, and paths. Do not keep alternate matching logic, broad fallback branches, or verbose `stop(...)` blocks for cases already resolved during inspection.
- Keep only lightweight checks that protect genuinely uncertain or user-editable inputs, such as required files, required columns, and output directory creation.
- Keep formulas, thresholds, grouping variables, and reference groups visible near the code that uses them.
- For tables, preserve feature names and annotations with clear column names.
- For result objects, use names that describe the analysis result rather than temporary implementation details.

## Verification

Add lightweight checks that protect the analysis:

- Required files exist.
- Loaded objects have the expected names.
- Required columns are present.
- Output directories exist or are created.
- Important saved files are printed at the end.

Avoid heavy defensive code for impossible scenarios. The goal is transparent analysis, not a full software package.

## Editing Existing Scripts

When revising an existing script, keep the user's analysis intent and local style. Touch only the parts needed for the requested change.

If the user likes a prior script style, mirror its header, Step layout, comment density, and output summary. Do not refactor unrelated code just to make it look different.

## Final Response

When reporting back, keep the response concise:

- Say which script or skill file was created or changed.
- Mention the main style rules now encoded.
- State whether validation or a syntax check was run.
- Note any assumptions or limitations.

## Avoid

- No speculative features.
- No large abstractions for single-use scripts.
- No hidden statistical assumptions.
- No unrelated formatting churn.
- No long comments that make the script harder to scan.

## Evolution

Keep this skill compact. Add templates, examples, or references only after a pattern is used repeatedly and is stable enough to maintain.
