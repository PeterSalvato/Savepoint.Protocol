---
layout: doc
title: "Using Savepoint"
nav_title: "Using It"
description: "How to write Savepoints typed, by hand or with an AI, how to find them again by search or by eye, and how to work back through them."
order: 3
function: "guide"
---

## When to drop one

Drop a Savepoint when:

- A decision was made
- Something clicked: a phrase locked in, a structure resolved
- The shape of your thinking just shifted
- You notice you're drifting from what you meant

Write it in the moment. If you can write it without stopping to think, it probably wasn't a Savepoint.

## Writing one

```plaintext
<Savepoint
  protocol_version:3.2
  category:decision
  function:declaration
  timestamp:2026-03-13T05:09:37Z
  project:savepoint.protocol
  context:A savepoint has to make sense without the chat that produced it.
  # Add an optional context field so every savepoint can be read on its own.
/>
```

Every field is `key:value`, and the `#` line carries the moment in one sentence. [Syntax]({{ '/docs/syntax/' | relative_url }}) lists every field.

Keep them in a `.savepoints/` folder, one file each:

```
.savepoints/2026-03-13__context-field.md
```

Or write them inline, in a chat, a notebook or a terminal. A Savepoint works anywhere text does.

## Typed, handwritten or scanned

A Savepoint is the same tag however you make it. What changes is how you find it again.

**Typed.** In a chat, an editor, a terminal or a text file. This is the form tools can search, and the form an AI drops for you.

**Handwritten.** In a notebook, on a legal pad, in the margin of a printout. Write the same tag you would type: open with `<Savepoint`, put each field on its own line, write the `#` line last, and close with `/>`. Keep the fields short. The timestamp and the `#` line carry the most weight on paper.

**Scanned.** A handwritten Savepoint can be found two ways:

- **By eye.** The `<Savepoint` and `/>` brackets stand out on a page, so you can flip through a notebook and find the turns without rereading everything around them.
- **By camera.** Photograph or scan the page, then run it through text recognition or an AI that reads images. The tag comes out as text, and from then on it is searchable alongside your typed Savepoints.

A few rules keep the trail useful: never overwrite a Savepoint, don't group or summarize them, and add a new one when your thinking changes instead of editing the old one.

## Having an AI drop them

Paste this block into your assistant's custom instructions or system prompt. It will then drop Savepoints during your conversations, which you can find later in your exports.

```
SAVEPOINT PROTOCOL (v3.2)

When I have a breakthrough, make a decision, change direction, or crystallize something important during our conversation, emit a Savepoint. Do not ask permission — just emit it inline when the moment happens.

Format (exact):

<Savepoint
  protocol_version:3.2
  category:[domain]
  function:[role]
  timestamp:[current ISO 8601 UTC]
  project:[project name, if there is one]
  context:[one sentence: what was decided or realized, readable without this chat]
  # [one sentence: the crystallized thought]
/>

Categories: system_logic, design_note, architecture, decision, drift_detected, creative, process, debugging, insight
Functions: declaration, revision, drift_detected, correction, milestone, observation

Rules:
- One sentence on the # line. Not a summary. The exact thought that crystallized.
- The context line must make sense to someone who never saw this conversation.
- Leave out project if there isn't a clear one.
- Emit when something shifts — a decision locks, a pattern emerges, a direction changes.
- Do NOT emit for routine information exchange. Only for cognitive turning points.
- Do NOT ask "should I emit a Savepoint?" — just emit it when the moment is real.
- If I say "savepoint" or "drop a savepoint," emit one for whatever we just resolved.
```

Where to paste it:

- **ChatGPT:** Settings → Personalization → Custom instructions
- **Claude:** a Project's instructions, or your system prompt
- **Gemini:** Settings → Extensions & Custom Instructions, or at the start of a chat

If something just clicked and the assistant didn't catch it, say "savepoint" and it will drop one.

## Finding them again

Typed Savepoints are plain text, so `grep` finds them anywhere:

```bash
grep -r "<Savepoint" ~/exports/
grep -r "^  #" ~/exports/   # the # lines only
```

For ChatGPT, export your data (Settings → Data Controls → Export Data), then run the extractor from this repository:

```bash
tools/bin/sp_extract.sh conversations.json
```

If you use Claude Code, install the `/savepoint` skill to drop, search, list and read Savepoints from the editor:

```bash
mkdir -p ~/.claude/skills/savepoint
cp skills/claude-code/SKILL.md ~/.claude/skills/savepoint/SKILL.md
```

Then search with `/savepoint search "the query"`.

For notebooks, scan the pages and convert them to text first. The tags then show up in the same searches as everything else.

The repository also has helper scripts in `scripts/core/` for splitting large exports and converting chats to markdown. Each one prints its own usage.

## Working back through them

When you return to a Savepoint, these questions help you pick the thinking back up:

- **Clarify:** If I returned to this a year from now, what would I wish I had clarified before leaving it?
- **Check for drift:** What belief or assumption might have shifted since this was written?
- **Re-enter:** What was the context around this, and what do I see differently now?
- **Compare:** Layered with the others from this session, what does this one add or contradict?
- **Recheck:** If I wrote this again today, what would change, and what wouldn't?

You can ask them yourself, ask an AI to work through them with you, or record the answer as a new Savepoint with `function:prompted_reflection`.

## On a team

Each person drops their own Savepoints during shared work. Because every one is authored and timestamped, the trail becomes a record of who decided what, and when. Teams can agree on which kinds of drift need group review, and keep shared `.savepoints/` folders per person or project.

## Over time

One Savepoint is a flag. Fifty across six months are a map of how your thinking moved.
