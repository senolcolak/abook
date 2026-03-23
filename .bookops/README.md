# BookOps — LLM Operating System

This directory is the **operating system** for the book development process. It contains everything the LLM agents need to work on the book — but no human-authored content.

## Architecture

```
Agents decide → Skills execute → Workflows sequence → Templates standardize
```

## Directory Map

| Directory | Purpose |
|-----------|---------|
| `config/` | Global rules, naming conventions, quality gates |
| `agents/` | Role definitions for each AI agent |
| `skills/` | Reusable task definitions with input/output schemas |
| `workflows/` | Ordered execution pipelines |
| `templates/` | Standardized output formats |
| `logs/` | Decision log, workflow runs, changelog |

## Key Rules

1. **Never modify `book/10_source_material/`** — source material is read-only after import
2. **No chapter rewrite without a chapter contract** in `book/30_structure/chapter-contracts/`
3. **Every major decision** must be logged in `logs/decisions.md`
4. **Every workflow run** must be logged in `logs/workflow-runs.md`
5. **Generated analysis** goes to `book/20_analysis/`, never mixed with source material

## Workflow Order

1. `01_ingest.yaml` — Import and classify raw material
2. `02_diagnose.yaml` — Analyze material for gaps, redundancy, themes
3. `03_structure.yaml` — Build and select book outline
4. `04_chapter_build.yaml` — Draft chapters with contracts
5. `05_revision.yaml` — Multi-pass revision
6. `06_release.yaml` — Compile and export final manuscript
