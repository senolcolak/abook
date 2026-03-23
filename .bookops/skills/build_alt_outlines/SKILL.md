---
name: Build Alternative Outlines
description: Generate multiple candidate book outlines from classified material
---

# Build Alternative Outlines

## Purpose

Generate 3 or more candidate book outlines based on the classified material, thesis, and reader persona. Each outline represents a different structural approach to the same content.

## Trigger Conditions

- After material classification is complete
- After thesis is extracted and validated
- When the author wants to explore structural alternatives

## Input Format

- `material_catalog`: Path to the classified material catalog
- `thesis`: The core thesis statement
- `reader_persona`: Path to reader persona
- `constraints`: Path to constraints file
- `num_candidates`: Number of outlines to generate (default: 3)

## Processing Steps

1. **Analyze material** — Review classified fragments and themes
2. **Identify groupings** — Find natural chapter-level groupings
3. **Generate outlines** — Create distinct structural approaches:
   - **Approach A**: Chronological / sequential
   - **Approach B**: Thematic / modular
   - **Approach C**: Problem → Solution / narrative arc
4. **Evaluate each** — Score against thesis alignment, reader journey, and feasibility
5. **Document trade-offs** — State what each outline optimizes for and what it sacrifices

## Output Contract

- `outlines`: Array of candidate outlines with chapters and rationale
- `comparison_matrix`: Side-by-side scoring of all candidates
- `recommendation`: Which outline to select and why
- `risks`: Risks associated with each approach

## Quality Checks

- [ ] At least 3 structurally distinct outlines generated
- [ ] Each outline serves the core thesis
- [ ] Trade-offs are explicitly stated
- [ ] Chapter count is within constraints

## Limitations

- Cannot evaluate prose quality (outlines are structural only)
- Requires sufficient classified material to form multiple groupings
