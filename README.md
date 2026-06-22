# script-forge

`script-forge` is a Codex skill for writing readable, maintainable scientific analysis scripts.

It is designed for researcher-facing workflows where the script itself should clearly explain what it does, how it runs, and which result files it produces. The first supported style is the current R analysis-script style used in the oral microbiome and saliva-metabolomics projects: a clear opening comment block, stepwise code sections, concise comments under each step, explicit paths, and minimal unnecessary abstraction.

## Skill Index

| Skill | Focus | Current Status |
| --- | --- | --- |
| `script-forge` | High-readability scientific analysis scripts, especially R scripts | Active, evolving |

## Design Principles

1. **Readable first**
   The script should be easy for a future researcher to reopen, understand, rerun, and revise.

2. **Explicit workflow**
   Each script starts with a compact header that states the goal, analysis flow, result files, and important notes.

3. **Step-based execution**
   Formal code is organized as `Step 1`, `Step 2`, `Step 3`, etc. Each step includes short comments explaining the intent of the following code block.

4. **Minimal but complete**
   Prefer linear, auditable scripts. Add helper functions only when they remove real repetition or make the analysis safer.

5. **Output-oriented**
   Result files, object names, tables, plots, and verification checks should be explicit rather than hidden in the code.

6. **Sustainable development**
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
Use $script-forge to write an R analysis script with a clear goal, workflow, output list, Step sections, and concise comments.
```

## Current Script Style

Every generated analysis script should normally include:

- An opening comment block with `目标`, `流程`, `结果文件`, and optional `说明`.
- A short path/configuration section before analysis steps.
- Visible `Step` sections.
- Short comments below each step heading that explain why the code is there.
- Explicit input and output paths.
- Focused verification, such as checking object names, key columns, dimensions, or saved outputs.

## Development Roadmap

- Add R templates once the core style stabilizes across more analyses.
- Add review checklists for existing scripts.
- Add examples for microbiome, metabolomics, and general statistical analysis.
- Extend to Python or shell scripts only after the R style is stable enough to reuse.
