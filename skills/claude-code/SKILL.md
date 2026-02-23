---
name: savepoint
description: "Drop, search, list, and read Savepoints — structured moments of clarity captured in v3.0 protocol syntax. Use when the user wants to record a decision, insight, or crystallized thought, or search/browse existing savepoints."
user_invocable: true
---

# Savepoint Protocol — Claude Code Skill

## Purpose

Savepoints are atomic, timestamped records of crystallized thought — decisions, insights, drift detections, or declarations captured in the moment they become clear. This skill implements the four core operations: drop, search, list, read.

## Quick Reference

```
/savepoint drop [content]     # Record a new savepoint
/savepoint search [query]     # Search across savepoints
/savepoint list               # List current project's savepoints
/savepoint read [path]        # Display a savepoint's full content
```

## Savepoint v3.0 Syntax

Every savepoint uses this exact format:

```
<Savepoint
  protocol_version:3.0
  category:[domain_context]
  function:[role]
  timestamp:[ISO 8601 UTC]
  # [semantic content]
/>
```

### Required Fields

| Field | Values |
|-------|--------|
| `protocol_version` | Always `3.0` |
| `category` | Domain context: `system_logic`, `design_note`, `architecture`, `decision`, `drift_detected`, `creative`, `process`, `debugging`, `insight` |
| `function` | Purpose: `declaration`, `revision`, `drift_detected`, `correction`, `milestone`, `observation` |
| `timestamp` | ISO 8601 UTC (e.g., `2025-04-08T15:43:00Z`) |
| `#` line | The actual semantic content — one line, the crystallized thought |

### Optional Fields

| Field | Values |
|-------|--------|
| `importance` | `high`, `medium`, `low` |
| `confidence` | `strong`, `moderate`, `provisional` |
| `influence` | Attribution — person, source, or related savepoint |

## Commands

### 1. `/savepoint drop [content]`

Record a new savepoint.

**Behavior:**

1. **Content:** If provided as argument, use it directly. If not provided, ask: "What crystallized?"
2. **Project:** Auto-detect from current working directory basename (e.g., `petersalvato.com`, `Savepoint.Protocol`)
3. **Timestamp:** Generate current UTC time in ISO 8601 format
4. **Category:** Suggest a category based on the content. Present it as a default the user can accept or change. Use these heuristics:
   - Contains "decided" / "choosing" / "going with" → `decision`
   - Contains "broke" / "fix" / "bug" / "wrong" → `debugging`
   - Contains "drift" / "deviated" / "off track" → `drift_detected`
   - Contains "structure" / "architecture" / "layout" → `architecture`
   - Contains "design" / "style" / "visual" → `design_note`
   - Contains "process" / "workflow" / "method" → `process`
   - Contains "realized" / "insight" / "pattern" → `insight`
   - Default → `system_logic`
5. **Function:** Default to `declaration`. If content suggests drift, use `drift_detected`. If it references changing a previous decision, use `revision`.
6. **Storage:** Save to `.savepoints/` in the project root (find project root by walking up from cwd looking for `.git/`). Create `.savepoints/` directory if it doesn't exist.
7. **Filename:** `YYYY-MM-DDTHH-MM-SSZ--[slugified-content].md`
   - Slugify: lowercase, replace spaces with hyphens, strip non-alphanumeric except hyphens, truncate to 60 chars
8. **Write** the file using the Write tool with the v3.0 syntax format.
9. **Confirm** by printing the savepoint content and file path.

**Example output file** (`.savepoints/2026-02-23T14-30-00Z--recursive-structures-replace-snapshots.md`):

```
<Savepoint
  protocol_version:3.0
  category:system_logic
  function:declaration
  timestamp:2026-02-23T14:30:00Z
  # Recursive structures should replace version snapshots wherever drift is likely.
/>
```

### 2. `/savepoint search [query]`

Search across savepoints.

**Behavior:**

1. **Search locations** (in order):
   - Current project's `.savepoints/` directory
   - All sibling projects: `~/homelab/projects/active/*/.savepoints/`
   - Any `.savepoints/` found by walking up from cwd
2. **Match against:**
   - The `#` content line (primary match)
   - The `category:` field value
   - The filename
3. **Use the Grep tool** to search with the query pattern across all `.savepoints/` directories.
4. **Display results** sorted by timestamp (most recent first), limited to 10:
   - Timestamp
   - Project name (from parent directory)
   - Content (the `#` line)
   - File path
5. If no results, say so and suggest broadening the query.

### 3. `/savepoint list`

List savepoints in current project.

**Behavior:**

1. Find project root (walk up from cwd looking for `.git/`).
2. **Use Glob tool** to find all `*.md` files in `.savepoints/` directory.
3. For each file, **use Read tool** to extract the `#` content line and `category:` field.
4. Display in chronological order (oldest first, based on filename timestamp):
   - Timestamp (from filename or `timestamp:` field)
   - Category
   - Content (truncated to 80 chars if needed)
   - Filename
5. Show count: "N savepoints in [project-name]"

### 4. `/savepoint read [path-or-filename]`

Display a savepoint's full content.

**Behavior:**

1. If a full path is given, read it directly.
2. If just a filename or partial match, search in current project's `.savepoints/` directory.
3. **Use Read tool** to display the full file content.
4. If multiple matches, list them and ask which one.

## Installation

To use with Claude Code, copy this skill file to your Claude Code skills directory:

```bash
mkdir -p ~/.claude/skills/savepoint
cp skills/claude-code/SKILL.md ~/.claude/skills/savepoint/SKILL.md
```

Then restart Claude Code. The `/savepoint` command will be available in all projects.

## Storage Convention

- Directory: `.savepoints/` at project root (same level as `.git/`)
- One file per savepoint
- Files are plain markdown containing the `<Savepoint ... />` tag
- Files are append-only — never edit existing savepoints. To correct one, drop a new savepoint with `function:revision` or `function:correction`.

## Notes

- Savepoints are lightweight. Drop them frequently. A savepoint that captures the wrong thing is better than a lost insight.
- The `#` content line should be one clear sentence — the crystallized thought, not a summary of the session.
- Category and function are structural metadata for search. Don't overthink them.
- Timestamps are always UTC.
