# Example: Basic Ingest

## Input

```yaml
skill: ingest_draft
input:
  source_files:
    - "~/Desktop/book-rough-draft.md"
    - "~/Desktop/interview-notes.md"
  source_type: "draft"
  preserve_originals: true
```

## Expected Output

```json
{
  "inventory": [
    {
      "fileName": "book-rough-draft.md",
      "destinationPath": "book/10_source_material/raw-draft/book-rough-draft.md",
      "wordCount": 42350,
      "fileSize": 245760,
      "contentType": "draft"
    },
    {
      "fileName": "interview-notes.md",
      "destinationPath": "book/10_source_material/raw-draft/interview-notes.md",
      "wordCount": 3200,
      "fileSize": 18432,
      "contentType": "draft"
    }
  ],
  "totalFiles": 2,
  "totalWordCount": 45550,
  "warnings": []
}
```

## Log Entry

```markdown
| 2024-01-15 | 01_ingest | ingest_draft | Imported 2 files (45,550 words) | ✅ Success |
```
