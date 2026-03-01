---
name: savepoint
description: "Drop, search, list, and read Savepoints — structured moments of clarity captured in v3.0 protocol syntax. Use when the user wants to record a decision, insight, or crystallized thought, or search/browse existing savepoints."
user_invocable: true
---

# Savepoint Protocol — Claude Code Skill

## Purpose

Savepoints are atomic, timestamped records of crystallized thought — decisions, insights, drift detections, or declarations captured in the moment they become clear. This skill implements the four core operations: drop, search, list, read.

## Installation

To use with Claude Code, copy this skill file to your Claude Code skills directory:

```bash
mkdir -p ~/.claude/skills/savepoint
cp skills/claude-code/SKILL.md ~/.claude/skills/savepoint/SKILL.md
```

Then restart Claude Code. The `/savepoint` command will be available in all projects.

## Quick Reference

```
/savepoint drop [content]     # Record a new savepoint
/savepoint search [query]     # Search across savepoints in conversation history
/savepoint list               # List recent savepoints from conversation history
/savepoint read [query]       # Find and display a savepoint from history
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
2. **Timestamp:** Generate current UTC time in ISO 8601 format (use `date -u +%Y-%m-%dT%H:%M:%SZ`)
3. **Category:** Suggest a category based on the content. Present it as a default the user can accept or change. Use these heuristics:
   - Contains "decided" / "choosing" / "going with" → `decision`
   - Contains "broke" / "fix" / "bug" / "wrong" → `debugging`
   - Contains "drift" / "deviated" / "off track" → `drift_detected`
   - Contains "structure" / "architecture" / "layout" → `architecture`
   - Contains "design" / "style" / "visual" → `design_note`
   - Contains "process" / "workflow" / "method" → `process`
   - Contains "realized" / "insight" / "pattern" → `insight`
   - Default → `system_logic`
4. **Function:** Default to `declaration`. If content suggests drift, use `drift_detected`. If it references changing a previous decision, use `revision`.
5. **Output:** Print the savepoint directly in the conversation using the v3.0 syntax. Do NOT write to disk.

**Why conversation, not files:** Savepoints are designed to be found during ideation history traversal. AI coding tools like Claude Code export conversation logs that can be searched later. Writing savepoints to isolated files puts them outside the searchable conversation stream. The conversation IS the archive — savepoints dropped in chat are automatically captured alongside the context that produced them.

**Example output** (printed in chat, not saved to file):

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

Search across savepoints in conversation history.

**Behavior:**

1. **Search locations** — search available conversation exports and session logs for `<Savepoint` tags:
   - Claude Code session logs (`.claude/projects/*/` JSONL files)
   - Any exported conversation archives the user has configured
2. **Match against:** The `<Savepoint` tag and `#` content line
3. **Display results** sorted by timestamp (most recent first), limited to 10:
   - Timestamp
   - Category
   - Content (the `#` line)
   - Source (which session/export it was found in)
4. If no results, say so and suggest broadening the query.

### 3. `/savepoint list`

List recent savepoints from conversation history.

**Behavior:**

1. Search the same locations as `/savepoint search` but with the pattern `<Savepoint` to find all savepoints.
2. Display in reverse chronological order (most recent first), limited to 20.
3. Show: timestamp, category, content (truncated to 80 chars), source.

### 4. `/savepoint read [query]`

Find and display a savepoint's full content from conversation history.

**Behavior:**

1. Search using the query across the same locations as `/savepoint search`.
2. Display the full `<Savepoint ... />` block with surrounding conversation context (a few lines before/after).
3. If multiple matches, list them and ask which one.

## Notes

- Savepoints are lightweight. Drop them frequently. A savepoint that captures the wrong thing is better than a lost insight.
- The `#` content line should be one clear sentence — the crystallized thought, not a summary of the session.
- Category and function are structural metadata for search. Don't overthink them.
- Timestamps are always UTC.
- NEVER write savepoints to disk. Print them in the conversation. The conversation exports are the archive.
