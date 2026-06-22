# script-forge

`script-forge` standardizes the readable analysis-script style used in the current research workflow.

## What It Enforces

- A concise pre-work checklist before implementation:
  `分析目标`, `输入数据`, `结果输出`, and `需要确认信息`.
- A script header with `目标`, `流程`, `结果文件`, and optional `说明`.
- Numbered `Step` sections for the formal code.
- Short explanatory comments below each Step.
- Explicit input paths, output paths, object names, thresholds, and grouping variables.
- Minimal helper functions and no unnecessary framework-like structure.
- No redundant exploratory matching or fallback code once the real data structure has been confirmed.

## Pre-Work Checklist

Before writing a new script, use this review-ready checklist:

1. **分析目标** - restate the analysis purpose.
2. **输入数据** - list input data paths and mark missing or uncertain inputs.
3. **结果输出** - list planned output files with paths.
4. **需要确认信息** - ask only the decisions needed before coding.

## Default Skeleton

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

# ---------- Step 1: 读取输入文件 ----------

# 读取本次分析需要的数据，并确认关键对象已经载入。

# ---------- Step 2: 整理分析数据 ----------

# 保留本次分析需要的列，并按照研究问题构建后续变量。

# ---------- Step 3: 保存结果 ----------

# 将核心结果保存到指定目录，并打印完成信息。
```

## Trigger Examples

```text
Use $script-forge to write this R analysis script.
```

```text
使用 $script-forge，先给我四段式工作清单，确认后再写脚本。
```

```text
用 $script-forge 按之前那种高可读风格改写这个脚本。
```

```text
用 $script-forge 检查这个分析脚本的可维护性。
```

## Current Scope

The skill currently focuses on R-based scientific analysis scripts. It may later grow into templates and review workflows for microbiome, metabolomics, general statistics, Python, and shell scripts.
