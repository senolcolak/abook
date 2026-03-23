---
name: Create Chapter Contract
description: Define a binding contract for what a chapter must accomplish before drafting begins
---

# Create Chapter Contract

## Purpose

Produce a detailed chapter contract that specifies the chapter's purpose, required content, source material, dependencies, transitions, and done criteria. No chapter should be drafted without a signed contract.

## Trigger Conditions

- After the selected outline is approved
- Before drafting any chapter
- When a chapter needs redesign

## Input Format

- `chapter_id`: Chapter identifier (e.g., "ch01")
- `outline`: Path to selected outline
- `chapter_map`: Path to chapter map
- `material_catalog`: Path to classified material catalog
- `transitions_map`: Path to transitions map
- `template`: Path to chapter contract template

## Processing Steps

1. **Load context** — Read the outline entry and chapter map for this chapter
2. **Select source material** — Identify which classified fragments belong to this chapter
3. **Define purpose** — State the reader problem this chapter solves
4. **Set boundaries** — Specify what to include AND what to exclude
5. **Map dependencies** — List which earlier chapters this one depends on
6. **Design transitions** — Define entry (from previous chapter) and exit (to next chapter)
7. **Set done criteria** — Define measurable criteria for when the chapter is complete
8. **Write contract** — Fill the template and save to `book/30_structure/chapter-contracts/`

## Output Contract

- `contract`: Filled chapter contract document
- `source_selection`: Mapping of source material to this chapter
- `dependency_warnings`: Any circular or heavy dependencies flagged

## Quality Checks

- [ ] Contract uses the standard template
- [ ] Purpose is specific to THIS chapter (not generic)
- [ ] Content to include AND exclude are both specified
- [ ] Done criteria are measurable, not vague
- [ ] Transitions are designed for both directions
- [ ] Source material is allocated (not duplicated across chapters without intent)

## Limitations

- Cannot guarantee the author will follow the contract
- Dependencies may change if the outline changes
- Source allocation conflicts must be resolved manually
