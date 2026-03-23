# Book Project

A two-layer repository for developing a book with LLM support.

## Architecture

| Layer | Path | Purpose |
|-------|------|---------|
| **Human content** | `book/` | Manuscript source of truth — drafts, notes, analysis, structure |
| **LLM operating system** | `.bookops/` | Agents, skills, workflows, templates, and logs |

These two layers **never mix**. AI prompts, workflow YAML, and generated analysis live in `.bookops/`. Drafts, notes, and the final manuscript live in `book/`.

## Quick Start

1. Place your existing draft material in `book/10_source_material/raw-draft/`
2. Fill out the foundation docs in `book/00_foundation/`
3. Run workflows from `.bookops/workflows/` in order (01 → 06)
4. Track decisions in `.bookops/logs/decisions.md`

## Directory Map

```
book/
  00_foundation/    ← Book identity: brief, persona, voice, thesis
  10_source_material/ ← Raw inputs: drafts, notes, research
  20_analysis/      ← Diagnostic reports generated during analysis
  30_structure/     ← Outlines, chapter map, contracts
  40_chapters/      ← Per-chapter folders with briefs, drafts, notes
  50_revision/      ← Multi-pass revision tracking
  60_release/       ← Final manuscript and export artifacts

.bookops/
  config/           ← Rules, naming conventions, quality gates
  agents/           ← Agent role definitions
  skills/           ← Reusable task definitions with schemas
  workflows/        ← Ordered execution pipelines
  templates/        ← Standardized output formats
  logs/             ← Decision log, workflow runs, changelog

scripts/            ← Shell helpers for validation, compilation, export
```

## Design Principles

1. Separate human content from AI system files
2. Modular agent architecture — not one monolithic prompt
3. Skills are reusable, narrow, and documented
4. Every workflow has clear inputs, outputs, and quality gates
5. Decisions and revisions are traceable
6. Structure first, prose second
7. No chapter rewrite without a chapter contract
8. Generated analysis never silently overwrites source material

## Key Rule

> **Agents decide, skills execute, workflows sequence, templates standardize.**

## Scripts

```bash
bash scripts/validate_structure.sh   # Check repo integrity
bash scripts/compile_book.sh         # Merge chapters into manuscript
bash scripts/export_manuscript.sh    # Export to release folder
```

## License

Private — all rights reserved.
