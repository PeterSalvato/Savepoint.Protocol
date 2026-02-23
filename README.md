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

## Trace your thinking. Don't just remember — author.

*Savepoint is the machete, not the map.*

A Savepoint is a timestamped, structured signal that says: *"Something happened here. Return."*

It's not a note. Not a summary. Not metadata. It's a semantic trail marker — a protocol for claiming where your thinking changed.

```plaintext
<Savepoint
  protocol_version:3.0
  category:system_logic
  function:declaration
  timestamp:2025-04-08T15:43:00Z
  # Recursive structures should replace version snapshots wherever drift is likely.
/>
```

---

## Quick Start

**1. Learn the shape.** A Savepoint is a self-closing tag with `key:value` attributes and a single `#` content line. That's it. [Full syntax →](./docs/savepoint.syntax.md)

**2. Drop one.** When a decision clicks, when meaning shifts, when you realize the shape of your thinking just changed — write a Savepoint. In any environment: plaintext, shell, chat, paper.

**3. Return to it.** Savepoints exist to be re-entered. Search them, traverse them, use them as reentry points for recursion — by yourself, your team, or an AI agent.

---

## Tools

### Claude Code Skill

Drop, search, list, and read Savepoints directly from your editor:

```bash
mkdir -p ~/.claude/skills/savepoint
cp skills/claude-code/SKILL.md ~/.claude/skills/savepoint/SKILL.md
```

Then use `/savepoint drop`, `/savepoint search`, `/savepoint list`, `/savepoint read` in any Claude Code session.

### CLI (Shell)

Extract Savepoints from ChatGPT conversation exports:

```bash
tools/bin/sp_extract.sh conversations.json
```

Install the `sp` command:

```bash
bash tools/install.sh
```

---

## Documentation

Start with the specification. Read the philosophy if you want to understand why.

| Document | What it covers |
|----------|---------------|
| [Specification](./docs/savepoint.syntax.md) | Canonical v3.0 syntax — fields, rules, examples |
| [Philosophy](./docs/philosophy.md) | The jungle cartography metaphor — why Savepoints exist |
| [Usage Guide](./docs/usage.md) | How to use Savepoints solo, in teams, and with AI |
| [Governance](./docs/governance.md) | How the protocol evolves, drift arbitration, forking rules |
| [Prompts](./docs/prompts.md) | Recursive prompt patterns for Savepoint reentry |
| [Version Log](./docs/version.log.md) | v1.0 → v2.0 → v3.0 syntax evolution |
| [Selector Cascade](./docs/2025-04-20-selector-cascade.md) | Document search behavior model |

---

## Repository Structure

```
docs/              Specification, philosophy, usage, governance
tools/             CLI tools (shell + Python)
  bin/             sp_extract, sp_drop (shell)
  cli/             Python CLI extractor
scripts/           Core utility scripts
skills/            Claude Code skill definition
.savepoints/       Real Savepoint logs from this project
```

---

## Use Cases

- Writers marking breakthroughs in phrasing or structure
- Designers noting system shifts or metaphor realignment
- Researchers capturing conceptual pivots
- Developers logging architecture decisions in thinking
- Teams layering Savepoints across roles for distributed cognitive mapping
- AI agents emitting Savepoints as self-governance tools

---

## Philosophy

Savepoint is not a tool. It's a symbolic language for tracing what matters.

It is low-tech, high-trust, stack-agnostic, format-degradable, and legible to both LLMs and humans. It resists feature creep. It honors inflection over information. It builds cognitive version control — not note capture.

When the forest regrows, the Savepoints remain.

[Read the full philosophy →](./docs/philosophy.md)

---

## License

Savepoint.Protocol is licensed under a custom non-commercial humanist license.
Use freely. Fork deeply. But preserve authorship and intent.

[LICENSE.md](./LICENSE.md)

---

## Author

**[Peter Salvato](https://petersalvato.com)** — Systems architect. Design, engineering, strategy.

**Full case study:** [petersalvato.com/protocols/savepoint-protocol/](https://petersalvato.com/protocols/savepoint-protocol/)

- Email: peter@petersalvato.com
- LinkedIn: [linkedin.com/in/petersalvato](https://linkedin.com/in/petersalvato)
