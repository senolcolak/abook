---
name: Classify Material
description: Tag and categorize source material fragments by theme, type, and quality
---

# Classify Material

## Purpose

Read source material and classify each fragment by theme (what it's about), type (argument, anecdote, data, quote, opinion), and quality (strong, usable, weak). Produces a structured catalog for downstream agents.

## Trigger Conditions

- After ingest is complete
- When new material is added
- When reclassification is needed after thesis refinement

## Input Format

- `source_dir`: Path to source material directory
- `themes`: Optional list of expected themes to look for
- `thesis`: The core thesis for relevance scoring

## Processing Steps

1. **Read** — Load all files in the source directory
2. **Fragment** — Break each file into logical fragments (paragraphs or sections)
3. **Classify theme** — Tag each fragment with one or more themes
4. **Classify type** — Tag as: argument, anecdote, data, quote, opinion, instruction, narrative
5. **Score quality** — Rate each fragment: strong, usable, weak, discard
6. **Score relevance** — Rate each fragment's relevance to the thesis: high, medium, low, off-topic
7. **Output catalog** — Produce structured classification

## Output Contract

- `catalog`: Array of classified fragments
- `theme_summary`: Themes found with fragment counts
- `quality_distribution`: Count of fragments per quality level
- `off_topic_fragments`: Fragments that don't serve the thesis

## Quality Checks

- [ ] Every fragment is classified (no untagged material)
- [ ] Themes are consistent (same theme name used for same concept)
- [ ] Quality ratings include justification
- [ ] Off-topic material is flagged, not deleted

## Limitations

- Cannot judge factual accuracy (that's Fact Checker's job)
- Classification is subjective — author should review borderline cases
- Large files may need splitting before classification
