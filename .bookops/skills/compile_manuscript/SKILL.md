---
name: Compile Manuscript
description: Merge all chapter drafts into a single final manuscript file
---

# Compile Manuscript

## Purpose

Concatenate all finalized chapter drafts in the correct order into a single manuscript file. Apply front matter, chapter headings, and page breaks. Output to `book/60_release/manuscript.md`.

## Trigger Conditions

- After all revision passes are complete
- When the author wants a full manuscript preview
- During the release workflow

## Input Format

- `chapter_dir`: Path to the chapters directory (e.g., "book/40_chapters/")
- `chapter_order`: Ordered array of chapter IDs (e.g., ["ch01", "ch02", ...])
- `include_front_matter`: Whether to prepend book brief as front matter
- `output_path`: Where to write the compiled manuscript

## Processing Steps

1. **Validate** — Confirm all chapters in the order list exist and have drafts
2. **Load** — Read each chapter draft in order
3. **Format** — Add chapter headings, separators, and page break markers
4. **Prepend front matter** — If requested, add title page and book brief content
5. **Compile** — Merge into a single file
6. **Word count** — Calculate total and per-chapter word counts
7. **Write** — Save to the output path
8. **Log** — Record compilation in workflow-runs.md

## Output Contract

- `manuscript_path`: Path to the compiled manuscript
- `total_word_count`: Total manuscript word count
- `chapter_word_counts`: Per-chapter word counts
- `missing_chapters`: Any chapters in the order list that had no draft
- `warnings`: Issues encountered during compilation

## Quality Checks

- [ ] All chapters are included in order
- [ ] No missing chapters (or missing ones are documented)
- [ ] Word count is calculated accurately
- [ ] Output file is well-formatted Markdown

## Limitations

- Does not edit or improve content — purely mechanical compilation
- Cannot compile binary assets (images) — references them by path
- Overwrites previous compilation at the output path
