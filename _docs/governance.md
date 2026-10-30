---
layout: doc
title: "Governance"
nav_title: "Governance"
description: "Governance rules for Savepoint Protocol evolution. Sovereign authorship, drift arbitration, protocol changes."
order: 4
function: "policy"
---

## Purpose

This document defines:

- How Savepoint.Protocol evolves
- How drift is tracked and interpreted
- How team environments enforce or challenge protocol rules
- Who holds semantic authorship and how recursive changes are governed

Governance here is architecture: it decides how the protocol holds its shape as it grows.

---

## Sovereign Authorship

Every Savepoint is authored, and so is every change to the protocol. Structural changes always carry a name.

The core syntax, naming, and purpose of the protocol are the intellectual property of its creator.
This governance structure protects that authorship while allowing transparent recursion and community alignment.

---

## Drift Arbitration

A `drift_detected` Savepoint is used to mark:
- Misalignment between behavior and protocol
- LLM deviation from format
- Team divergence from rules
- Systematic misunderstanding

When drift occurs, it must be:
- Marked via Savepoint (`function:drift_detected`)
- Interpreted via prompt (see [Prompts]({{ '/docs/prompts/' | relative_url }}))
- Reviewed at the team or author level
- Kept, and reflected on recursively

Drift marks a reflection boundary: the point where it is worth stopping to look.

---

## Protocol Changes

Savepoint format or structural changes must be:

- Issued in the `version.log.md`
- Anchored via a Savepoint of `function:protocol_change`
- Included in the `.savepoints/` semantic ledger

Example Savepoint for version shift:

```plaintext
<Savepoint
  protocol_version:3.0
  category:protocol_evolution
  function:version_upgrade
  timestamp:2025-04-15T11:00:00Z
  # We are transitioning to v3.1 to support embedded authorship fields.
/>
```

Protocol changes are:

- Declared
- Authored
- Traversable

---

## Team Reflection Protocols

Teams using Savepoint.Protocol may establish:

- Shared Savepoint directories (per user or project)
- Agreement on which drift types require group review
- function: namespace extensions for internal purposes
- Savepoint overlays layered by role, perspective, or time

All team-generated Savepoints are subordinate to:

- The canonical [syntax]({{ '/docs/syntax/' | relative_url }})
- The active [version log]({{ '/docs/version-log/' | relative_url }})
- Authorship logic declared in this document

---

## Forking

Savepoint.Protocol may be adapted conceptually. It may not be rebranded, forked, or restructured for commercial or derivative systems.

- Forking the syntax or Savepoint logic is not permitted.
- You may layer systems on top of Savepoints.
- You may extend team behavior through Savepoints.
- You may not claim authorship or identity outside permitted overlays.

These rules keep one protocol as it scales.

---

Governance authored April 8, 2025
