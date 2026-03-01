---
layout: doc
title: "Selector Cascade — Savepoint.Protocol"
nav_title: "Selector Cascade"
description: "Selector Cascade and Relevance Filter model for Savepoint document search behavior."
order: 11
---

```
<Savepoint
  protocol_version:3.0
  category:[retrieval_logic]
  function:[document_search_behavior]
  timestamp:2025-04-20T23:56:00Z
  # Selector Cascade + Relevance Filter model for document queries

  When searching documents for a phrase or concept, the assistant must follow a two-phase model:

  1. LITERAL SELECTOR (INCLUSIVE)
     - Return all exact matches of the input string or term across document files.
     - Do not filter by context or assume meaning.
     - This acts as the base scope — all further processing operates only within these hits.

  2. CONTEXTUAL FILTER (INTERPRETIVE)
     - For each literal hit, examine the surrounding paragraph/sentence context.
     - Determine whether it aligns with the user's implied domain (e.g., IA, copywriting, philosophy).
     - Label each hit as:
         ✔ STRONG MATCH — clearly relevant to intended context
         ⚠️ CONDITIONAL — possibly relevant depending on prior definition or surrounding thread
         ✖ WEAK/NO MATCH — unrelated despite the literal match

  3. STRUCTURED RETURN
     - Present all hits in structured form, showing:
         - Quote
         - Contextual justification
         - Match level (✔, ⚠️, ✖)
     - Do not exclude any hits — let the user be final judge of inclusion.
     - Avoid assumptions about terminology; surface first, interpret second.

  This structure preserves user authority, ensures transparency, and prevents false negatives from over-filtering. It mirrors VS Code-style literal search with layered human interpretation, aligning the assistant's behavior with real-world creative workflows.

  This logic supersedes any earlier pattern that prioritized conceptual searches before literal retrieval. Interpretation happens *after* matching, not before.

/>
```
