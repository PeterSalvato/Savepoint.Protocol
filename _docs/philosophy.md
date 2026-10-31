---
layout: doc
title: "Why Savepoint Exists"
nav_title: "Why It Exists"
description: "Why Savepoint exists, what a Savepoint is, and real ones from the trail left while building the protocol."
order: 1
function: "declaration"
---

My thinking has always ended up in containers that bury it. It started in journals and sketchbooks. Then I thought out loud, dictating into notes apps and Obsidian. Now a lot of it happens in long conversations with AI models. I've worked through a novel that way, the architecture of a business, and a lot of creative ideation.

Each of those is flat. A decision from page forty of a sketchbook, halfway down a dictated note, or three hundred messages into a chat is in there somewhere, mixed in with everything around it. Finding it means rereading all of it, so mostly I didn't, and I lost months of thinking that way.

Savepoint is a mark I make at the moment something is decided, in whatever I happen to be writing in. Later I can find the turns without rereading everything between them, and hand the next session, or the next notebook, enough to pick up where the last one left off.

## What a Savepoint is

A Savepoint marks the moment thinking changed shape. It is one self-closing tag, written while you still remember why: when it happened, what kind of moment it was, and one line saying what changed.

This is how I defined it while building the protocol:

```
<Savepoint
  protocol_version:3.0
  category:design_philosophy
  function:declaration
  confidence:strong
  timestamp:2025-04-12T16:00:00Z
  # A Savepoint is not a note. Notes capture information. Savepoints mark inflection — the moment thinking changed shape. If you can write it without stopping, it probably wasn't a Savepoint.
/>
```

## From the trail

These come from the `.savepoints/` folder in this repository: the trail I left while building the protocol itself.

The format settling, April 10, 2025:

```
<Savepoint
  protocol_version:3.0
  category:protocol_evolution
  function:revision
  importance:high
  confidence:strong
  timestamp:2025-04-10T09:15:00Z
  # The self-closing tag format is final. v1 (YAML frontmatter) was too heavy, v2 (triple-pipe) was too clever. v3 sits at the right weight — parseable by machines, writable by hand, readable by anyone.
/>
```

Catching drift five days later:

```
<Savepoint
  protocol_version:3.0
  category:system_logic
  function:drift_detected
  importance:medium
  confidence:moderate
  timestamp:2025-04-15T11:22:00Z
  # Early users are writing multi-line content after the # marker. The protocol allows exactly one content line. Need to decide: enforce strictly (reject multi-line) or allow soft wrapping with a single semantic statement. Enforcing strictly preserves the constraint that forces clarity.
/>
```

Finding the right first tool, ten months on:

```
<Savepoint
  protocol_version:3.0
  category:tooling
  function:declaration
  importance:high
  confidence:strong
  timestamp:2026-02-23T13:00:00Z
  # The Claude Code skill is the first fully functional Savepoint authoring tool. Drop, search, list, read — all working through natural language in the editor. The CLI shell tool was never the right first interface. An LLM that understands the protocol is.
/>
```

Read in order, those lines are the project's history, and each one says why the next step happened.

## How it works in practice

Drop a Savepoint when something shifts: a decision locks, a phrase lands, or you notice you've drifted from what you meant. Don't stop to organize them.

When you come back, follow the trail. Search by keyword or project, read the `#` lines, and pick up where the thinking turned.

I think of it as marking a path through dense jungle. On the first pass you can't tell what will matter, so you drop flares. On the second pass you follow them back.

## Next

- [Syntax]({{ '/docs/syntax/' | relative_url }}): the full tag and its fields
- [Using It]({{ '/docs/usage/' | relative_url }}): dropping Savepoints by hand or with an AI, and finding them again
- [Governance]({{ '/docs/governance/' | relative_url }}): authorship, rules and license
