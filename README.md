# script-forge

`script-forge` is a Codex skill for writing readable, maintainable scientific analysis scripts.

It is designed for researcher-facing workflows where the analysis should be confirmed before coding, and the final script should clearly explain what it does, how it runs, and which result files it produces. The first supported style is the current R analysis-script style used in the oral microbiome and saliva-metabolomics projects: a concise pre-work checklist, a clear opening comment block, stepwise code sections, concise comments under each step, explicit paths, and minimal unnecessary abstraction.

## Skill Index

| Skill | Focus | Current Status |
| --- | --- | --- |
| `script-forge` | Checklist-first, high-readability scientific analysis scripts, especially R scripts | Active, evolving |

## Design Principles

1. **Readable first**
   The script should be easy for a future researcher to reopen, understand, rerun, and revise.

2. **Checklist before coding**
   Before implementation, summarize the work in four review-ready parts: `分析目标`, `输入数据`, `结果输出`, and `需要确认信息`.

3. **Explicit workflow**
   Each script starts with a compact header that states the goal, analysis flow, result files, and important notes.

4. **Step-based execution**
   Formal code is organized as `Step 1`, `Step 2`, `Step 3`, etc. Each step includes short comments explaining the intent of the following code block.

5. **Minimal but complete**
   Prefer linear, auditable scripts. Add helper functions only when they remove real repetition or make the analysis safer.

6. **Output-oriented**
   Result files, object names, tables, plots, and verification checks should be explicit rather than hidden in the code.

7. **No redundant exploratory code**
   Use exploratory checks while inspecting data, but do not carry broad fallback branches or resolved matching logic into the final script.

8. **Sustainable development**
   The current skill is intentionally small. More templates, examples, and language-specific conventions can be added as repeated needs become stable.

## Repository Layout

```text
script-forge/
|-- SKILL.md
|-- README.md
`-- agents/
    `-- openai.yaml
```

## Installation

Install this repository as a Codex skill source, then invoke the skill as:

```text
$script-forge
```

Example request:

```text
Use $script-forge to first provide a four-part checklist, then write an R analysis script with clear Step sections and concise comments.
```

## Pre-Work Checklist

Before writing a new analysis script, `script-forge` should provide a concise checklist for user review:

1. **分析目标** - confirm the intended analysis.
2. **输入数据** - list provided input files with paths; mark missing or uncertain inputs.
3. **结果输出** - list planned result files with output paths.
4. **需要确认信息** - ask only the necessary decisions before coding.

## Current Script Style

Every generated analysis script should normally include:

- A short pre-work checklist before implementation unless the user explicitly skips it.
- An opening comment block with `目标`, `流程`, `结果文件`, and optional `说明`.
- A short path/configuration section before analysis steps.
- Visible `Step` sections.
- Short comments below each step heading that explain why the code is there.
- Explicit input and output paths.
- Focused verification for genuinely uncertain or user-editable inputs.
- No redundant exploratory code after object names, ID columns, grouping variables, and paths have already been confirmed.

## Development Roadmap

- Add R templates once the core style stabilizes across more analyses.
- Add review checklists for existing scripts.
- Add examples for microbiome, metabolomics, and general statistical analysis.
- Extend to Python or shell scripts only after the R style is stable enough to reuse.
