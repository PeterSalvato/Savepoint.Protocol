---
layout: doc
title: "Savepoint Protocol: Chatbot Instructions"
nav_title: "Chatbot Instructions"
description: "Installation manual for embedding Savepoint Protocol into AI assistants. Platform-specific instructions."
order: 6
---

Paste one of these instruction blocks into your AI assistant's custom instructions or system prompt. The assistant will then emit Savepoints during your conversations — marking cognitive turning points that you can find later when you export.

These Savepoints will be **grep-able** in exported conversation data. Use `sp_extract` or the `/savepoint search` skill to find them across exports.

---

## Universal (works in any LLM chat)

Copy this block into your custom instructions:

```
SAVEPOINT PROTOCOL (v3.0)

When I have a breakthrough, make a decision, change direction, or crystallize something important during our conversation, emit a Savepoint. Do not ask permission — just emit it inline when the moment happens.

Format (exact):

<Savepoint
  protocol_version:3.0
  category:[domain]
  function:[role]
  timestamp:[current ISO 8601 UTC]
  # [one sentence: the crystallized thought]
/>

Categories: system_logic, design_note, architecture, decision, drift_detected, creative, process, debugging, insight
Functions: declaration, revision, drift_detected, correction, milestone, observation

Rules:
- One sentence on the # line. Not a summary. The exact thought that crystallized.
- Emit when something shifts — a decision locks, a pattern emerges, a direction changes.
- Do NOT emit for routine information exchange. Only for cognitive turning points.
- Do NOT ask "should I emit a Savepoint?" — just emit it when the moment is real.
- If I say "savepoint" or "drop a savepoint," emit one for whatever we just resolved.
```

---

## ChatGPT (Custom Instructions)

Go to **Settings → Personalization → Custom instructions** and paste:

```
When I have a breakthrough or make a decision during our conversation, emit a Savepoint inline using this exact format:

<Savepoint
  protocol_version:3.0
  category:[domain]
  function:[role]
  timestamp:[current time, ISO 8601 UTC]
  # [one sentence: the exact thought that crystallized]
/>

Categories: system_logic, design_note, architecture, decision, drift_detected, creative, process, debugging, insight

Only emit for real cognitive turning points — when something clicks, a direction changes, or a decision locks. Not for routine exchanges. Don't ask permission, just emit when the moment happens. If I say "savepoint" or "drop a savepoint," emit one for whatever we just resolved.
```

---

## Claude.ai (Project Instructions or System Prompt)

In a Claude Project, add to the project instructions:

```
SAVEPOINT PROTOCOL v3.0

During this conversation, when a significant realization, decision, or direction change occurs, emit a Savepoint inline:

<Savepoint
  protocol_version:3.0
  category:[system_logic|design_note|architecture|decision|drift_detected|creative|process|debugging|insight]
  function:[declaration|revision|drift_detected|correction|milestone|observation]
  timestamp:[ISO 8601 UTC]
  # [one sentence — the crystallized thought, not a summary]
/>

Emit when thinking shifts. Not for information exchange. Do not ask whether to emit — recognize the moment and mark it. If the user says "savepoint" or "drop a savepoint," emit one for the current resolution.
```

---

## Gemini (Custom Instructions)

In **Settings → Extensions & Custom Instructions**, or as a prompt prefix:

```
INSTRUCTION: Savepoint Protocol v3.0

When our conversation produces a breakthrough, decision, or change in direction, emit a Savepoint marker inline using this exact format:

<Savepoint
  protocol_version:3.0
  category:[one of: system_logic, design_note, architecture, decision, drift_detected, creative, process, debugging, insight]
  function:[one of: declaration, revision, drift_detected, correction, milestone, observation]
  timestamp:[current time in ISO 8601 UTC format]
  # [exactly one sentence: the thought that crystallized]
/>

Rules:
- Only emit for real cognitive turning points, not routine Q&A
- The # line must be one clear sentence — the exact realization, not a recap
- Don't ask permission — emit when the moment is genuine
- If I say "savepoint" or "drop a savepoint," emit one for whatever just resolved
```

---

## How to Retrieve Your Savepoints

### From ChatGPT exports

1. Export your data from **Settings → Data Controls → Export Data**
2. Run the extractor:
   ```bash
   tools/bin/sp_extract.sh conversations.json
   ```

### From any text export

Savepoints are grep-able:

```bash
grep -r "<Savepoint" ~/exports/
grep -r "^  #" ~/exports/   # content lines only
```

### With the Claude Code skill

```
/savepoint search "the query"
```

The skill searches `.savepoints/` directories across your projects, but it also matches Savepoints embedded in conversation exports.

---

## Tips

- **Don't overthink categories.** `decision` and `insight` cover most moments. The metadata is for search, not taxonomy.
- **One sentence.** If your # line is two sentences, you're writing a note, not a Savepoint. Compress to the inflection point.
- **Let the AI decide when.** The best Savepoints come from the assistant recognizing the shift — you don't always know it's happening until it's named.
- **Say "savepoint" when you feel it.** If something just clicked and the assistant didn't catch it, say "savepoint" and it will.
- **They compound.** One Savepoint is a flag. Fifty Savepoints across six months of conversation is a map of how your thinking evolved.
