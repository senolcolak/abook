---
name: Map Transitions
description: Analyze and design transitions between chapters for smooth reader flow
---

# Map Transitions

## Purpose

Examine the connections between consecutive chapters to identify shared concepts that bridge them. Design transition strategies (hooks, questions, callbacks) and flag weak or missing transitions.

## Trigger Conditions

- After the selected outline is finalized
- After chapter drafts exist (to evaluate actual transitions)
- When the Reader Simulator reports weak transitions

## Input Format

- `chapter_sequence`: Ordered list of chapter IDs
- `chapter_summaries`: Brief summary of each chapter's content
- `drafts`: Optional paths to actual chapter drafts (for post-draft analysis)

## Processing Steps

1. **Pair chapters** — Create ordered pairs (Ch1→Ch2, Ch2→Ch3, etc.)
2. **Identify bridges** — Find shared concepts between each pair
3. **Design strategies** — For each pair, recommend a transition technique
4. **Evaluate** — If drafts exist, assess whether transitions are implemented
5. **Report** — Output the transitions map

## Output Contract

- `transitions`: Array of chapter-pair transition records
- `weak_transitions`: Pairs with weak or missing connections
- `strategies`: Recommended transition techniques per pair

## Quality Checks

- [ ] Every consecutive chapter pair has a transition entry
- [ ] Weak transitions are explicitly flagged
- [ ] Strategies are specific, not generic

## Limitations

- Cannot write the transition prose — only designs the approach
- Pre-draft analysis is speculative; post-draft analysis is more accurate
