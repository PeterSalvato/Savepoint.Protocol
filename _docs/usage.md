---
layout: doc
title: "Usage Guide – Savepoint.Protocol"
nav_title: "Usage"
description: "Practical guide to using Savepoint Protocol. When to drop, solo and team use, AI integration."
order: 3
---

## When to Drop a Savepoint

Drop a Savepoint when:
- A decision was made
- Something clicked — a phrase locked in, a structure resolved
- You realize the shape of your thinking just shifted
- Drift is occurring — you're moving away from prior intent
- You need to flag a recursion point for yourself, your team, or an AI agent

They're not about what you know. They're about what just happened.

---

## Writing Your First Savepoint

```plaintext
<Savepoint
  protocol_version:3.0
  category:design_logic
  function:declaration
  timestamp:2025-04-08T21:24:00Z
  # A Savepoint declares: "This moment matters. Return here later."
/>
```

The format is a self-closing tag. Every field is `key:value`. The content begins with `#` and carries the semantic weight — one line, one crystallized thought.

Save it to a file:
```
.savepoints/2025-04-08T21-24-00Z--this-moment-matters.md
```

Or write it inline — in a chat, a notebook, a terminal. Savepoints are portable.

---

## Solo Use

Drop Savepoints during creative work, journaling, design, problem-solving. Return later to reflect, clarify, track drift, or recurse through meaning.

You don't need a platform. You need a symbol.

### Behavior Rules

- Never overwrite a Savepoint
- Never group them by theme or type
- Never compress or re-summarize
- Only reference them. Only return to them.

You're not building a system of record. You're building semantic navigation through the jungle.

---

## Team Use

Savepoint.Protocol supports multi-user environments:

- Each participant lays Savepoints during shared sessions
- Savepoints remain authored, timestamped, and context-specific
- Teams can:
  - Layer Savepoints across roles and subgroups
  - Query semantic drift or insight events
  - Track decisions through collective recursion

The result is a cognitive overlay layer — a distributed, recursive authorship map over complex collaboration.

---

## AI + System Use

Savepoints are readable and generatable by LLMs, CLI tools, grep-based workflows, notebooks, and semantic search layers. Agents can emit Savepoints, interpret them, and use them for orientation or flagging.

### Claude Code Skill

If you use Claude Code, install the `/savepoint` skill for native drop/search/list/read:

```bash
mkdir -p ~/.claude/skills/savepoint
cp skills/claude-code/SKILL.md ~/.claude/skills/savepoint/SKILL.md
```

### Shell CLI

Extract Savepoints from ChatGPT conversation exports:

```bash
tools/bin/sp_extract.sh conversations.json
```

---

## Recursive Prompts

Savepoints pair with recursive prompts for deeper reentry. These are not conversation starters — they're semantic instruments for navigating nonlinear reflection.

**Savepoint Clarification:**
> If I returned to this Savepoint a year from now, what would I wish I had clarified before leaving it?

**Reverse Drift:**
> What belief or assumption might have shifted since this Savepoint was written?

**Semantic Reentry:**
> What was the context surrounding this Savepoint — and what do I now see differently?

**Self-Alignment Recheck:**
> If I wrote this Savepoint again today, what would change — and what wouldn't?

See [prompts.md](./prompts.md) for the full set.

---

## Examples

### Flagging drift in a live session

```plaintext
<Savepoint
  protocol_version:3.0
  category:runtime_disagreement
  function:drift_detected
  timestamp:2025-04-08T20:58:00Z
  # Assistant defaulted to markdown block when v3.0 specifies self-closing syntax. Realigned.
/>
```

### Marking a turning point

```plaintext
<Savepoint
  protocol_version:3.0
  category:project_commitment
  function:inflection
  timestamp:2025-04-08T21:00:00Z
  # We shifted from ideation into execution. System boundary conditions now locked.
/>
```

### Reentry point for future self

```plaintext
<Savepoint
  protocol_version:3.0
  category:recursive_onboarding
  function:reentry_marker
  timestamp:2025-04-08T21:04:00Z
  # If returning here from a future drift, resume with version-history.md and cross-reference today's manifest.
/>
```

### Intentional drift acknowledgment

```plaintext
<Savepoint
  protocol_version:3.0
  category:protocol_theory
  function:intentional_drift
  timestamp:2025-04-08T21:06:00Z
  # Breaking syntax convention here to test recursive tolerance. This Savepoint knowingly deviates.
/>
```

---

## Why It Works

Because meaning isn't stored. It's **marked**.
Because truth doesn't stay still. It **drifts**.
Because no one remembers what mattered midstream — unless they left themselves a structure to return by.

This protocol is that structure.
