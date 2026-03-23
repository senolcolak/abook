---
name: Ingest Draft
description: Import raw draft material into the repository and prepare it for classification
---

# Ingest Draft

## Purpose

Take raw draft material (text files, markdown, converted documents) and import it into `book/10_source_material/raw-draft/` while preserving originals and creating an initial content inventory.

## Trigger Conditions

- New manuscript material is available for import
- Author adds new draft content to the project
- Material exists outside the repository that needs to be brought in

## Input Format

See `input.schema.json` for the formal schema.

- `source_files`: List of file paths to import
- `source_type`: Type of material (draft, notes, research, anecdotes, references)
- `preserve_originals`: Whether to keep original file names (default: true)

## Processing Steps

1. **Validate** — Check that source files exist and are readable text
2. **Catalog** — Record each file's name, size, word count, and apparent content type
3. **Import** — Copy files to the appropriate subdirectory under `book/10_source_material/`
4. **Inventory** — Create or update a content inventory listing all imported files
5. **Log** — Record the ingest action in `.bookops/logs/workflow-runs.md`

## Output Contract

See `output.schema.json` for the formal schema.

- `inventory`: Array of imported file records with metadata
- `total_files`: Count of files imported
- `total_word_count`: Aggregate word count
- `warnings`: Any issues encountered during import (encoding, empty files, etc.)

## Quality Checks

- [ ] All files were copied successfully
- [ ] No files were modified during import
- [ ] Word counts are recorded
- [ ] Import logged in workflow-runs.md
- [ ] No files in `book/10_source_material/` were overwritten

## Limitations

- Cannot process binary formats (PDF, DOCX) directly — convert to Markdown first
- Does not classify material — that's the `classify_material` skill
- Does not deduplicate — that's the `detect_repetition` skill

## Example Invocation

See `examples/basic-ingest.md` for a complete example.

```yaml
skill: ingest_draft
input:
  source_files:
    - "/path/to/chapter-rough-1.md"
    - "/path/to/misc-notes.txt"
  source_type: "draft"
  preserve_originals: true
```
