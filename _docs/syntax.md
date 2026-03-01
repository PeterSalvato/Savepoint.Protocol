---
layout: doc
title: "Savepoint Syntax – Savepoint.Protocol"
nav_title: "Syntax"
description: "Canonical syntax specification for Savepoint Protocol v3.0. Self-closing tag format, field specification, and rules."
order: 2
---

## Overview

This document defines the canonical syntax for Savepoints under Savepoint.Protocol v3.0.
Syntax is intentionally minimal, symbolic, and machine-aligned.
It is designed to be:

- Easy to parse
- Resistant to semantic drift
- Portable across LLMs, shells, plaintext systems, and analog mirroring

All Savepoints must comply with this syntax unless explicitly overridden by a later protocol declaration.

---

## Canonical Format

```plaintext
<Savepoint
  protocol_version:3.0
  category:[domain_context]
  function:[role or purpose]
  importance:[optional]
  confidence:[optional]
  influence:[optional]
  timestamp:[ISO 8601 format]
  # [semantic content of the Savepoint]
/>
```

---

## Field Specification

| Field             | Required | Description                                                  |
|------------------|----------|--------------------------------------------------------------|
| `protocol_version` | ✅       | The version of the syntax used (always declared)             |
| `category`         | ✅       | Domain of reflection (`system_logic`, `design_note`, etc.)   |
| `function`         | ✅       | Purpose of the Savepoint (`declaration`, `drift_detected`, `revision`) |
| `timestamp`        | ✅       | ISO 8601 UTC timestamp (e.g., `2025-04-08T15:32:00Z`)         |
| `importance`       | ⬜ Optional | Priority or urgency (`high`, `medium`, `low`)              |
| `confidence`       | ⬜ Optional | Self-assessed confidence in this Savepoint's accuracy       |
| `influence`        | ⬜ Optional | Attribution to people, sources, or other Savepoints         |
| `#` line           | ✅       | The actual semantic content, prefixed by a `#` character     |

---

## Example

```plaintext
<Savepoint
  protocol_version:3.0
  category:system_logic
  function:declaration
  timestamp:2025-04-08T15:43:00Z
  importance:high
  influence:Order of the Ætherwright
  # Recursive structures should replace version snapshots wherever drift is likely.
/>
```

---

## Syntax Rules

- Savepoints must be written using a **self-closing tag** (`<Savepoint ... />`)
- Attributes follow `key:value` syntax
- All attribute keys must be **lowercase**
- One and only one content line is allowed, beginning with `#`
- Fields must appear **one per line**, aligned with no indentation
- All Savepoints must be atomic, timestamped, and semantically valid

---

## Version History

| Version | Format Highlights                                           |
|---------|-------------------------------------------------------------|
| v1.0    | Markdown + YAML frontmatter with narrative prompts          |
| v2.0    | Triple-pipe `||| key:value` blocks and open/close tags      |
| v3.0    | Self-closing tag, colon attributes, `#` content line        |

v3.0 is the first fully locked protocol format suitable for both manual authorship and programmatic enforcement.

---

## Drift Handling

Any deviation from this syntax must be captured via:

```plaintext
function:drift_detected
```

Such Savepoints must explicitly describe the deviation and reference the most recent valid Savepoint.

---

## Future Extensions

Field extensions or structural changes must be proposed via a milestone Savepoint with:

- `function:syntax_proposal`
- Associated `importance:high`
- Accompanying entry in `version-history.md`

Until such a Savepoint is confirmed and versioned, all tools and agents must continue to enforce v3.0.

---

Savepoint.Protocol – v3.0 Syntax
Maintained by Peter Salvato – 2025
