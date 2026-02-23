> This system is currently published for visibility, authorship, and reflective exploration.  
> It is not open source or commercially licensable at this time.  
> See LICENSE.md for usage terms.  
> Contact Peter Salvato directly for consultation, collaboration, or licensing inquiries.


# Savepoint.Protocol

> Canonical Public Release: v1.0 (2025-04-08)  
> Protocol Syntax Version: 3.0  
> Author: Peter Salvato  
> © 2025 Peter Salvato. All rights reserved.  
> All terminology, structure, and logic protected under custom license.

---

## Trace your thinking. Don’t just remember—author.  
*Savepoint is the machete, not the map.*

Savepoint.Protocol™ is a symbolic markup system for capturing cognitive turning points—moments when realization clicks, phrasing locks in, or meaning shifts direction.

It’s not memory. It’s authorship infrastructure.  
Built for thinkers in wild terrain.

Savepoints are not summaries. Not notes. Not metadata.
They are semantic trail markers—a protocol for claiming where your thinking changed.

---

## Why Savepoint Exists (Framing Context)

Modern systems—especially AI—are building passive memory: endless recall, zero perspective.

They remember everything, but not what mattered.
They store what you said, but not what changed you.

This is the problem: **black box memory**. You can search your history but not trace your authorship.

Savepoint.Protocol exists to solve that.

- It captures *semantic inflection*—when something clicked
- It preserves *your phrasing*—not just data
- It restores authorship in a sea of machine retention

Whether you’re writing, designing, debugging, or philosophizing: Savepoints let you track when meaning moved.

---

## What Savepoint Is

A Savepoint is:
- A self-authored realization
- Timestamped and structured
- Stored in plaintext, written by hand, or parsed from AI logs
- A system-agnostic **semantic artifact**

You don’t need a platform. You need a symbol.

---

## Canonical Syntax (v3.0)

Savepoints are declared using a self-closing tag:

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

### Required Fields
- `protocol_version`: always declared (current = 3.0)  
- `category`: domain of reflection (e.g. `design_note`, `model_shift`)  
- `function`: purpose (`declaration`, `revision`, `drift_detected`)  
- `timestamp`: ISO 8601 UTC format  
- `#`: the actual semantic content

### Optional Fields
- `importance`: high, medium, low  
- `confidence`: self-assessed certainty  
- `influence`: source, reference, or attribution

[Full specification →](https://github.com/peterSalvato/savepoint-protocol/blob/main/spec/savepoint-spec-v1.md)

---

## Use Cases

- Writers marking breakthroughs in phrasing or structure
- Designers noting system shifts or metaphor realignment
- Researchers capturing conceptual pivots
- Developers logging architecture changes in thinking
- Philosophers flagging turns in internal logic

---

## Tools

### CLI (Shell)

Shell-based tools for working with Savepoints:

```bash
# Extract savepoints from ChatGPT conversation exports
tools/bin/sp_extract.sh conversations.json

# Install the sp command
bash tools/install.sh
```

### Claude Code Skill

A Claude Code skill for dropping, searching, listing, and reading Savepoints directly from your editor:

```bash
# Install the skill
mkdir -p ~/.claude/skills/savepoint
cp skills/claude-code/SKILL.md ~/.claude/skills/savepoint/SKILL.md
```

Then use `/savepoint drop`, `/savepoint search`, `/savepoint list`, `/savepoint read` in any Claude Code session.

---

## Repository Structure

```
/docs/         – Specification, philosophy, examples, governance
/tools/        – CLI tools (shell + Python)
/scripts/      – Core utility scripts
/skills/       – Claude Code skill definition
/.savepoints/  – Real Savepoint logs from this project
```

---

## Philosophy

Savepoint is not a tool. It’s a symbolic language for tracing what matters.

It is:
- Low-tech
- High-trust
- Stack-agnostic
- Format-degradable
- Legible to LLMs and legible to you

It resists feature creep.
It honors inflection over information.
It builds cognitive version control—not just note capture.

When the forest regrows, the Savepoints remain.

[Read the full philosophy →](https://github.com/peterSalvato/savepoint-protocol/blob/main/docs/philosophy.md)

---

## License

Savepoint.Protocol is licensed under a custom humanist license.  
Use freely. Fork deeply. But preserve authorship and intent.

License: [license.md](https://github.com/peterSalvato/savepoint-protocol/blob/main/license.md)

---

## Author

**Peter Salvato**  
Author of Savepoint.Protocol  
System Architect: Order of the Ætherwright
