---
layout: doc
title: "Version Log – Savepoint.Protocol"
nav_title: "Version Log"
description: "Chronological changelog of Savepoint Protocol versions. v1.0 through v3.0 evolution."
order: 9
---

## v1.0 – Origin Format (Retired)

### Date: Early March 2025
### Format:
- Markdown reflection prompts
- YAML frontmatter (`---`)
- Freeform authorship inside journal-like entries

### Characteristics:
- Unstructured
- Compatible with markdown notebooks
- Human-readable, but non-parseable
- Lacked recursion fidelity and structural enforcement

### Deprecated Because:
- Could not support drift tracking or team overlays
- Difficult to validate across tools
- Too close to traditional journaling

---

## v2.0 – Piped Metadata + Open/Close Tags (Superseded)

### Date: March 28–31, 2025
### Format:
- Triple-pipe metadata headers (`||| key:value`)
- `<Savepoint>` open and close block structure
- Markdown inside

### Characteristics:
- More structured than v1
- Still visually bulky and fragile
- Metadata was parseable, but irregular in behavior
- Savepoints looked like blog entries

### Deprecated Because:
- Format confusion with YAML and markdown
- No enforcement of atomicity
- Verbosity slowed traversal and obscured recursion intent

---

## v3.0 – Canonical Syntax (Active)

### Date: April 2–8, 2025
### Format:
- Self-closing tag: `<Savepoint ... />`
- Colon-delimited key-value pairs
- Single `#` line for semantic content
- No close tag
- Fully atomic

```plaintext
<Savepoint
  protocol_version:3.0
  category:conceptual_boundary
  function:initial_release
  timestamp:2025-04-08T20:58:00Z
  # This Savepoint marks the canonical release of version 3.0.
/>
```
