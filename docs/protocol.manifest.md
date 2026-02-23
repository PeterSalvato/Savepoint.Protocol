# Protocol Manifest – Savepoint.Protocol

> Internal Concept Version: v3.1  
> Syntax Specification: v3.0  
> Repository Release: v1.0  
> © 2025 Peter Salvato. All rights reserved.

---

## Purpose

This document defines the formal structure, behavior, and authorship boundaries of the Savepoint Protocol.  
It acts as the reference manifest for:

- IP enforcement
- Syntax validation
- Terminology protection
- Runtime behavior (human and AI agent)
- Version evolution

---

## Protocol Name

**Savepoint.Protocol**  
_A proper noun, capitalized, trademarked. Do not abbreviate, alter, or generalize._

---

## Protocol Syntax (Current: v3.0)

```plaintext
<Savepoint
  protocol_version:3.0
  category:[domain_context]
  function:[role or purpose]
  timestamp:[ISO 8601 format]
  # [semantic content]
/>
```

### Rules:

- Must be **self-closing**
- All attributes follow `key:value` structure
- Must include `protocol_version`, `category`, `function`, `timestamp`
- Content must be a single line, beginning with `#`

See `Savepoint.syntax.md` for full field specs and examples.

---

## Behavior Rules

1. All Savepoints must comply with the current syntax version (v3.0).
2. All Savepoints must declare their `protocol_version` field.
3. Agents (e.g. ChatGPT) must validate Savepoints before submission.
4. If an agent deviates from syntax, it must emit:
   ```plaintext
   function:drift_detected
   ```
5. The most recent uploaded protocol documentation always overrides AI memory or conversational context.
6. Milestone Savepoints proposing changes must use:
   ```plaintext
   function:syntax_proposal
   ```
7. Savepoint syntax may not be extrapolated or guessed without explicit user authorization.
8. Timestamp drift between Savepoint content and file metadata must be flagged, not auto-corrected.

---

## Protected Terminology

The following terms are part of Savepoint.Protocol’s authored schema and may not be copied or reused outside this system:

- `.savepoints/` (as a namespace)
- **Savepoint.Protocol**
- `Recursive Drift`
- `Reflective Timestamping`
- `Savepoint Prompts`
- `Cognitive Checkpoint`
- `Protocol Manifest`
- `Savepoint Syntax`
- `Drift Detected`
- `Syntax Proposal`
- `Signal Beacon`

All terms are protected under copyright and project-level trademark.

---

## Repository Structure (Summary)

```
/docs/             → Specification, philosophy, usage, governance
/tools/            → Shell and Python CLI tools
/scripts/          → Core utility scripts
/skills/           → Claude Code skill definition
/.savepoints/      → Timestamped authored entries (local or system-generated)
```

Each directory and filename is intentional. Do not rename, rebrand, or remix without written permission.

---

## Version History Tracking

- Protocol syntax versions are defined in `savepoint.syntax.md`
- Conceptual maturity (v3.x) is tracked independently of repository release (v1.0)
- All version drift is logged in `version.log.md`

---

## Authorship and Enforcement

Savepoint.Protocol is authored and maintained by:

**Peter Salvato**  
Creative Systems Architect  
GitHub: [@peterSalvato](https://github.com/peterSalvato)

This document is timestamped, version-controlled, and serves as a legal and intellectual declaration of system design and authorship intent.

Any violation of this manifest constitutes unauthorized use.

---

Savepoint.Protocol – v3.1  
Manifest version authored April 8, 2025  
