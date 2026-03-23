#!/usr/bin/env bash
# validate_structure.sh — Check that all required directories and key files exist
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ERRORS=0

check_dir() {
  if [ ! -d "$PROJECT_ROOT/$1" ]; then
    echo "❌ MISSING DIR:  $1"
    ERRORS=$((ERRORS + 1))
  else
    echo "✅ DIR:          $1"
  fi
}

check_file() {
  if [ ! -f "$PROJECT_ROOT/$1" ]; then
    echo "❌ MISSING FILE: $1"
    ERRORS=$((ERRORS + 1))
  else
    echo "✅ FILE:         $1"
  fi
}

echo "=========================================="
echo "  Book Project Structure Validator"
echo "=========================================="
echo ""
echo "Project root: $PROJECT_ROOT"
echo ""

# Root files
echo "--- Root Files ---"
check_file "README.md"
check_file "PROJECT.md"
check_file ".gitignore"

# Book layer
echo ""
echo "--- Book: Foundation ---"
check_dir  "book/00_foundation"
check_file "book/00_foundation/book-brief.md"
check_file "book/00_foundation/reader-persona.md"
check_file "book/00_foundation/voice-style-guide.md"
check_file "book/00_foundation/thesis-and-promise.md"
check_file "book/00_foundation/glossary.md"
check_file "book/00_foundation/constraints.md"

echo ""
echo "--- Book: Source Material ---"
check_dir "book/10_source_material/raw-draft"
check_dir "book/10_source_material/notes"
check_dir "book/10_source_material/anecdotes"
check_dir "book/10_source_material/research"
check_dir "book/10_source_material/references"

echo ""
echo "--- Book: Analysis ---"
check_dir  "book/20_analysis"
check_file "book/20_analysis/redundancy-report.md"
check_file "book/20_analysis/gap-analysis.md"
check_file "book/20_analysis/theme-map.md"
check_file "book/20_analysis/reader-confusion-points.md"
check_file "book/20_analysis/structural-diagnostics.md"

echo ""
echo "--- Book: Structure ---"
check_dir  "book/30_structure"
check_dir  "book/30_structure/candidate-outlines"
check_dir  "book/30_structure/chapter-contracts"
check_file "book/30_structure/selected-outline.md"
check_file "book/30_structure/chapter-map.md"
check_file "book/30_structure/transitions-map.md"

echo ""
echo "--- Book: Chapters ---"
check_dir  "book/40_chapters/ch01"
check_file "book/40_chapters/ch01/chapter-brief.md"
check_file "book/40_chapters/ch01/source-selection.md"
check_file "book/40_chapters/ch01/draft.md"
check_file "book/40_chapters/ch01/revision-notes.md"
check_dir  "book/40_chapters/ch01/assets"

echo ""
echo "--- Book: Revision ---"
check_dir "book/50_revision/structural-pass"
check_dir "book/50_revision/clarity-pass"
check_dir "book/50_revision/voice-pass"
check_dir "book/50_revision/consistency-pass"
check_dir "book/50_revision/fact-check-pass"

echo ""
echo "--- Book: Release ---"
check_dir  "book/60_release"
check_dir  "book/60_release/export"
check_file "book/60_release/manuscript.md"
check_file "book/60_release/synopsis.md"
check_file "book/60_release/back-cover.md"

# BookOps layer
echo ""
echo "--- BookOps: Config ---"
check_file ".bookops/README.md"
check_file ".bookops/config/workflow-rules.yaml"
check_file ".bookops/config/naming-conventions.yaml"
check_file ".bookops/config/quality-gates.yaml"

echo ""
echo "--- BookOps: Agents ---"
for agent in orchestrator book-architect material-analyst chapter-designer developmental-editor voice-editor reader-simulator fact-checker; do
  check_file ".bookops/agents/$agent.md"
done

echo ""
echo "--- BookOps: Skills ---"
for skill in ingest_draft extract_core_thesis classify_material build_alt_outlines create_chapter_contract detect_repetition map_transitions run_reader_simulation consistency_check compile_manuscript; do
  check_dir  ".bookops/skills/$skill"
  check_file ".bookops/skills/$skill/SKILL.md"
  check_file ".bookops/skills/$skill/input.schema.json"
  check_file ".bookops/skills/$skill/output.schema.json"
  check_dir  ".bookops/skills/$skill/examples"
done

echo ""
echo "--- BookOps: Workflows ---"
for wf in 01_ingest 02_diagnose 03_structure 04_chapter_build 05_revision 06_release; do
  check_file ".bookops/workflows/$wf.yaml"
done

echo ""
echo "--- BookOps: Templates ---"
check_file ".bookops/templates/book-brief.template.md"
check_file ".bookops/templates/chapter-contract.template.md"
check_file ".bookops/templates/analysis-report.template.md"
check_file ".bookops/templates/chapter-brief.template.md"
check_file ".bookops/templates/revision-pass.template.md"

echo ""
echo "--- BookOps: Logs ---"
check_file ".bookops/logs/decisions.md"
check_file ".bookops/logs/workflow-runs.md"
check_file ".bookops/logs/change-log.md"

echo ""
echo "--- Scripts ---"
check_file "scripts/validate_structure.sh"
check_file "scripts/compile_book.sh"
check_file "scripts/export_manuscript.sh"

# Summary
echo ""
echo "=========================================="
if [ $ERRORS -eq 0 ]; then
  echo "✅ All checks passed! Repository structure is complete."
else
  echo "❌ $ERRORS issue(s) found. Please fix the missing items."
fi
echo "=========================================="

exit $ERRORS
