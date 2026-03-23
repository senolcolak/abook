# Example: Thesis Extraction

## Input

```yaml
skill: extract_core_thesis
input:
  source_files:
    - "book/10_source_material/raw-draft/full-manuscript-v1.md"
    - "book/10_source_material/notes/key-ideas.md"
  existing_thesis: "Technology changes how we think about creativity"
  reader_persona: "book/00_foundation/reader-persona.md"
```

## Expected Output

```json
{
  "recommendedThesis": "The tools we use to create don't just assist creativity — they reshape what we consider creative, and understanding this shift is essential for anyone who makes things for a living.",
  "candidates": [
    {
      "thesis": "Technology changes how we think about creativity",
      "specificity": 3,
      "defensibility": 5,
      "readerRelevance": 6
    },
    {
      "thesis": "The tools we use to create reshape what we consider creative",
      "specificity": 7,
      "defensibility": 7,
      "readerRelevance": 8
    },
    {
      "thesis": "Creative professionals must understand their tools' influence on their output",
      "specificity": 8,
      "defensibility": 8,
      "readerRelevance": 9
    }
  ],
  "confidence": "medium",
  "gaps": [
    "Limited evidence for historical precedents",
    "No case studies from non-tech creative fields"
  ]
}
```
