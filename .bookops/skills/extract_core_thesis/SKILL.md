---
name: Extract Core Thesis
description: Identify and articulate the central thesis from raw source material
---

# Extract Core Thesis

## Purpose

Analyze source material to identify the author's central argument, main claims, and supporting evidence patterns. Produce a structured thesis statement that can guide the entire book.

## Trigger Conditions

- After ingest is complete and material is cataloged
- When the author wants to clarify or validate their thesis
- When structural decisions require a clear thesis to evaluate against

## Input Format

See `input.schema.json`.

- `source_files`: Paths to source material files to analyze
- `existing_thesis`: Optional — author's current thesis draft for comparison
- `reader_persona`: Path to the reader persona file

## Processing Steps

1. **Scan** — Read all source material, identify recurring arguments and claims
2. **Extract candidates** — Pull out 3–5 potential thesis statements from the material
3. **Evaluate** — Score each candidate for specificity, defensibility, and reader relevance
4. **Recommend** — Select the strongest thesis with rationale
5. **Map evidence** — Show which source material supports the recommended thesis

## Output Contract

See `output.schema.json`.

- `recommended_thesis`: The single strongest thesis statement
- `candidates`: Array of alternative thesis statements with scores
- `evidence_map`: Which source fragments support which thesis
- `gaps`: What evidence is missing
- `confidence`: Overall confidence level (high/medium/low)

## Quality Checks

- [ ] Thesis is a specific, defensible claim (not a truism)
- [ ] Thesis is supportable by the existing source material
- [ ] Thesis is relevant to the target reader
- [ ] At least 3 candidates were evaluated
- [ ] Evidence map covers the recommended thesis

## Limitations

- Cannot generate a thesis from insufficient material
- Relies on explicit textual content — cannot infer unstated author intentions
- May produce generic results if source material lacks a clear argument

## Example Invocation

See `examples/thesis-extraction.md`.
