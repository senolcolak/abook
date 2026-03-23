---
name: Run Reader Simulation
description: Simulate the reading experience from the target reader's perspective
---

# Run Reader Simulation

## Purpose

Read chapter drafts through the lens of the target reader persona. Identify moments of confusion, boredom, frustration, and delight. Evaluate whether the book delivers on its promise.

## Trigger Conditions

- After chapter drafts exist
- After structural revision pass
- As a final pre-release check
- When the author wants feedback on a specific chapter

## Input Format

- `chapter_paths`: Array of chapter draft file paths (in reading order)
- `reader_persona`: Path to reader persona file
- `thesis`: The book's core thesis
- `promise`: The promise to the reader
- `mode`: "single_chapter" or "full_book"

## Processing Steps

1. **Adopt persona** — Load the reader persona and read from that perspective
2. **Read sequentially** — Process each chapter in order
3. **Log reactions** — At each section, note: engagement level, confusion points, questions arising, desire to continue
4. **Evaluate transitions** — Rate each chapter boundary
5. **Check promise** — At the end, assess whether the promise was delivered
6. **Report** — Produce a structured reader experience report

## Output Contract

- `experience_log`: Per-section engagement and reaction data
- `confusion_points`: Array of specific confusion moments with location
- `boredom_risks`: Sections where reader attention may drop
- `transition_quality`: Rating for each chapter boundary
- `promise_delivered`: Boolean with explanation
- `overall_score`: 1–10 reading experience score

## Quality Checks

- [ ] Report is anchored to specific text locations
- [ ] Reader persona is consistently applied
- [ ] Both positive and negative reactions are noted
- [ ] Promise evaluation is based on the stated promise, not assumed goals

## Limitations

- Simulation is approximate — not a substitute for real reader feedback
- Cannot simulate emotional response beyond the persona definition
- Results are best with polished drafts, noisy with rough drafts
