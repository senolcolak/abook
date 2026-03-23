---
name: Consistency Check
description: Verify cross-chapter consistency in terminology, facts, claims, and style
---

# Consistency Check

## Purpose

Scan all chapter drafts for inconsistencies in terminology, factual claims, character/example names, chronological references, and stylistic choices. Ensure the book reads as a unified whole.

## Trigger Conditions

- During the consistency revision pass
- After multiple chapters have been drafted
- After significant revisions to any chapter

## Input Format

- `chapter_paths`: Array of all chapter draft paths
- `glossary`: Path to glossary file
- `voice_guide`: Path to voice style guide
- `fact_check_results`: Optional path to fact-check results

## Processing Steps

1. **Extract terms** — Build a list of all defined terms and their usage
2. **Cross-reference** — Check each term is used consistently across chapters
3. **Check facts** — Verify factual claims don't contradict each other across chapters
4. **Check names** — Ensure people, places, and examples are named consistently
5. **Check chronology** — Verify temporal references don't conflict
6. **Check style** — Spot-check style adherence against voice guide
7. **Report** — Produce consistency report with issues and locations

## Output Contract

- `terminology_issues`: Terms used inconsistently
- `factual_conflicts`: Claims that contradict each other
- `naming_issues`: Inconsistent names or references
- `chronology_issues`: Timeline conflicts
- `style_drift`: Sections where style deviates from the guide
- `total_issues`: Count by severity (critical, moderate, minor)

## Quality Checks

- [ ] All chapters are included in the scan
- [ ] Issues cite specific locations in both conflicting files
- [ ] Severity is assigned to each issue

## Limitations

- Cannot resolve inconsistencies — only identifies them
- Relies on the glossary being up to date
- May not catch subtle tonal drift without a detailed voice guide
