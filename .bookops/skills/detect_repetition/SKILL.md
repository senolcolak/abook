---
name: Detect Repetition
description: Find repeated ideas, arguments, phrases, and examples across the manuscript
---

# Detect Repetition

## Purpose

Scan the source material or chapter drafts to find ideas, arguments, examples, and phrases that appear multiple times. Distinguish between intentional repetition (reinforcement) and unintentional redundancy.

## Trigger Conditions

- During the diagnosis workflow
- After chapter drafts are written (cross-chapter check)
- When the author suspects redundancy

## Input Format

- `scan_paths`: Array of file paths to scan
- `sensitivity`: How aggressive to be (strict / moderate / lenient)
- `ignore_glossary_terms`: Whether to skip glossary terms from repetition counts

## Processing Steps

1. **Extract ideas** — Parse each file for distinct ideas and arguments
2. **Extract phrases** — Identify recurring phrases (3+ word sequences)
3. **Cross-reference** — Compare ideas and phrases across all files
4. **Classify** — For each repetition, classify as: intentional reinforcement, structural overlap, or redundancy
5. **Report** — Produce the redundancy report with locations and recommendations

## Output Contract

- `repeated_ideas`: Array of ideas found in multiple locations
- `repeated_phrases`: Array of phrases with occurrence counts
- `overlapping_sections`: Pairs of sections covering the same ground
- `recommendations`: Consolidate, keep, or cut for each finding

## Quality Checks

- [ ] All scanned files are included in analysis
- [ ] Each finding includes specific file and section locations
- [ ] Recommendations distinguish between useful and harmful repetition

## Limitations

- Cannot determine author intent — classification is a suggestion
- Synonym detection is imperfect (may miss paraphrased repetition)
- Very short fragments may produce false positives
