# AGENTS.md

This file is the generic AI-agent entrypoint for the `r-script-writing-standards` skill.

Before performing any R script writing, review, refactoring, or adaptation task, read `SKILL.md`. `SKILL.md` is the authoritative workflow and defines scenario routing, required information checks, code style rules, function placement, reproducibility expectations, and output requirements.

## Core Flow

User request -> identify scenario -> read the matching workflow -> inspect references/templates as needed -> draft or revise the script -> self-check -> return script plus assumptions, inputs, outputs, and user-editable parameters.

## Scenario Map

- New R script: `workflows/write-r-analysis-script.md`
- Existing R script review or cleanup: `workflows/review-r-script.md`
- Paper method, GitHub code, or prior script adaptation: `workflows/adapt-reference-code.md`
- Template request: `templates/r_analysis_script.R`
- Style-only question: `references/r_style_rules.md`

## Compatibility

This skill is a pure Markdown workflow with R code templates. It has no required Python, shell, or external command dependency.

Do not create package scaffolding, test infrastructure, CI files, or complex project structure unless the user explicitly asks for that.
