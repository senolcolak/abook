#!/usr/bin/env bash
# compile_book.sh — Concatenate chapter drafts into a single manuscript
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CHAPTERS_DIR="$PROJECT_ROOT/book/40_chapters"
OUTPUT="$PROJECT_ROOT/book/60_release/manuscript.md"

echo "=========================================="
echo "  Book Compiler"
echo "=========================================="
echo ""

# Find all chapter directories, sorted
CHAPTER_DIRS=$(find "$CHAPTERS_DIR" -mindepth 1 -maxdepth 1 -type d | sort)

if [ -z "$CHAPTER_DIRS" ]; then
  echo "❌ No chapter directories found in $CHAPTERS_DIR"
  exit 1
fi

# Start manuscript
{
  echo "# Manuscript"
  echo ""
  echo "> Compiled on: $(date '+%Y-%m-%d %H:%M')"
  echo ""
  echo "---"
  echo ""

  TOTAL_WORDS=0
  CHAPTER_COUNT=0

  for dir in $CHAPTER_DIRS; do
    CHAPTER_NAME=$(basename "$dir")
    DRAFT="$dir/draft.md"

    if [ -f "$DRAFT" ]; then
      CHAPTER_COUNT=$((CHAPTER_COUNT + 1))
      WORDS=$(wc -w < "$DRAFT" | tr -d ' ')
      TOTAL_WORDS=$((TOTAL_WORDS + WORDS))

      echo ""
      echo "---"
      echo ""
      echo "<!-- CHAPTER: $CHAPTER_NAME ($WORDS words) -->"
      echo ""
      cat "$DRAFT"
      echo ""

      echo "  ✅ $CHAPTER_NAME: $WORDS words" >&2
    else
      echo "  ⚠️  $CHAPTER_NAME: no draft.md found — skipping" >&2
    fi
  done

  echo ""
  echo "---"
  echo ""
  echo "<!-- END OF MANUSCRIPT -->"
  echo "<!-- Total chapters: $CHAPTER_COUNT -->"
  echo "<!-- Total words: $TOTAL_WORDS -->"
} > "$OUTPUT"

echo ""
echo "=========================================="
echo "✅ Manuscript compiled to: $OUTPUT"
echo "   Chapters: $CHAPTER_COUNT"
echo "   Total words: $TOTAL_WORDS"
echo "=========================================="
