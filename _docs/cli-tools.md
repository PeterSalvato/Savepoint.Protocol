---
layout: doc
title: "CLI Tools – Savepoint.Protocol"
nav_title: "CLI Tools"
description: "Shell and script tool reference for Savepoint Protocol. Extract, drop, and install commands."
order: 7
---

Tools for processing conversation exports and working with Savepoints from the command line.

---

## Shell Tools (`tools/bin/`)

### `sp_extract.sh`
Extracts Savepoints from exported ChatGPT conversation JSON files. Parses conversations, identifies Savepoint-formatted content, and outputs structured `.md` files.

```bash
tools/bin/sp_extract.sh conversations.json
```

### `sp_drop.sh`
Manual Savepoint creation from the command line. *(Not yet implemented — use the Claude Code skill for `/savepoint drop` instead.)*

### `sp_install.sh`
Installs the `sp` command to your system PATH.

```bash
bash tools/install.sh
```

## Core Scripts (`scripts/core/`)

### `sp-export-to-md.sh`
Converts matching titled chats into `.md` files with YAML frontmatter.

### `sp-keeper-extract.sh`
Extracts all `keeper_message` objects from chunked JSON.

### `sp-split-json-chunks.sh`
Splits large `conversations.json` files into smaller 25-item chunks.

---

Each script contains embedded usage instructions and can be run without flags or arguments.
