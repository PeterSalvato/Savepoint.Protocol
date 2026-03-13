# Savepoint Syntax – Savepoint.Protocol

> Syntax Version: v3.2
> Repository Release: v1.0
> © 2025–2026 Peter Salvato. All rights reserved.

---

## Overview

This document defines the canonical syntax for Savepoints under Savepoint.Protocol v3.2.
Syntax is intentionally minimal, symbolic, and machine-aligned.
It is designed to be:

- Easy to parse
- Resistant to semantic drift
- Portable across LLMs, shells, plaintext systems, and analog mirroring
- Reconstructable without surrounding conversation context

All Savepoints must comply with this syntax unless explicitly overridden by a later protocol declaration.

---

## Canonical Format

```plaintext
<Savepoint
  protocol_version:3.2
  category:[domain_context]
  function:[role or purpose]
  timestamp:[ISO 8601 format]
  project:[project scope]
  keywords:[comma-separated terms]
  context:[reconstruction payload]
  importance:[optional]
  confidence:[optional]
  influence:[optional]
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
| `project`          | ⬜ Optional | Project scope for filtering (e.g., `homelab`, `petersalvato.com`) |
| `keywords`         | ⬜ Optional | Comma-separated search terms for traversal                   |
| `context`          | ⬜ Optional | One sentence: what was decided, realized, or shifted. The reconstruction payload. Without it, meaning requires reading surrounding conversation. |
| `importance`       | ⬜ Optional | Priority or urgency (`high`, `medium`, `low`)              |
| `confidence`       | ⬜ Optional | Self-assessed confidence in this Savepoint’s accuracy       |
| `influence`        | ⬜ Optional | Attribution to people, sources, or other Savepoints         |
| `#` line           | ✅       | The actual semantic content, prefixed by a `#` character     |

---

## The `#` Line vs. `context:` Field

The `#` line names the moment. It is a headline: greppable, scannable, one sentence.

The `context:` field captures what the moment holds. It is the reconstruction payload: enough substance that a future session (or a future person) can understand what happened without reading the conversation that produced it.

A savepoint with only the `#` line tells you *that* something crystallized. A savepoint with a `context:` line tells you *what* crystallized. The difference matters during traversal: the `#` line gets you to the right neighborhood, the `context:` line lets you reconstruct without reading 200 lines of surrounding chat.

---

## Examples

```plaintext
<Savepoint
  protocol_version:3.2
  category:system_logic
  function:declaration
  timestamp:2025-04-08T15:43:00Z
  importance:high
  influence:Order of the Ætherwright
  context:When state changes frequently and snapshots go stale, the structure itself should recurse rather than being captured at a point in time.
  # Recursive structures should replace version snapshots wherever drift is likely.
/>
```

```plaintext
<Savepoint
  protocol_version:3.2
  category:decision
  function:declaration
  timestamp:2026-03-13T05:09:37Z
  project:petersalvato.com
  keywords:kate osbourne, modernist homestead, kitchen accommodation, essay pitch, book
  context:Essay is the door, podcast is the visit, book is the return. Three layers, one relationship. Essay first, pitch follows when the proof exists.
  # Two-touch strategy for Kate Osbourne: pitch now with an essay on kitchen/food accommodation for neurodivergent households.
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
| v3.1    | Added `project:` scoping and `keywords:` for traversal at scale |
| v3.2    | Added `context:` reconstruction payload for self-contained meaning |

v3.0 established the locked tag format. v3.1 and v3.2 added optional fields without changing structure. The self-closing tag syntax is final.

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

Until such a Savepoint is confirmed and versioned, all tools and agents must continue to enforce v3.2.

---

Savepoint.Protocol – v3.2 Syntax
Maintained by Peter Salvato – 2025–2026  

