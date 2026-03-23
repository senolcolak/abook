#!/usr/bin/env bash
# export_manuscript.sh — Export the compiled manuscript to the release export directory
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MANUSCRIPT="$PROJECT_ROOT/book/60_release/manuscript.md"
EXPORT_DIR="$PROJECT_ROOT/book/60_release/export"

echo "=========================================="
echo "  Manuscript Exporter"
echo "=========================================="
echo ""

if [ ! -f "$MANUSCRIPT" ]; then
  echo "❌ No manuscript found at $MANUSCRIPT"
  echo "   Run compile_book.sh first."
  exit 1
fi

# Create export directory if needed
mkdir -p "$EXPORT_DIR"

# Export as timestamped Markdown
TIMESTAMP=$(date '+%Y%m%d_%H%M')
EXPORT_FILE="$EXPORT_DIR/manuscript_${TIMESTAMP}.md"

cp "$MANUSCRIPT" "$EXPORT_FILE"

# Calculate stats
WORDS=$(wc -w < "$MANUSCRIPT" | tr -d ' ')
LINES=$(wc -l < "$MANUSCRIPT" | tr -d ' ')
SIZE=$(wc -c < "$MANUSCRIPT" | tr -d ' ')

echo "✅ Exported to: $EXPORT_FILE"
echo ""
echo "   Words: $WORDS"
echo "   Lines: $LINES"
echo "   Size:  $SIZE bytes"
echo ""

# Optional: If pandoc is available, also export as other formats
if command -v pandoc &> /dev/null; then
  echo "📄 Pandoc detected — generating additional formats..."
  
  DOCX_FILE="$EXPORT_DIR/manuscript_${TIMESTAMP}.docx"
  pandoc "$MANUSCRIPT" -o "$DOCX_FILE" --from markdown --to docx 2>/dev/null && \
    echo "   ✅ DOCX: $DOCX_FILE" || \
    echo "   ⚠️  DOCX export failed"

  HTML_FILE="$EXPORT_DIR/manuscript_${TIMESTAMP}.html"
  pandoc "$MANUSCRIPT" -o "$HTML_FILE" --from markdown --to html --standalone 2>/dev/null && \
    echo "   ✅ HTML: $HTML_FILE" || \
    echo "   ⚠️  HTML export failed"
else
  echo "ℹ️  Install pandoc for DOCX/HTML/PDF export support."
fi

echo ""
echo "=========================================="
echo "  Export complete"
echo "=========================================="
