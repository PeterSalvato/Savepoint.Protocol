---
name: SavepointProtocol
description: A typed document. Courier Prime on cool copy paper, typewriter display faces with wear in the letters only, and ditto-machine purple as the one accent.

colors:
  paper: "#eef0ee"        # cool copy paper, the page
  ink: "#26282b"          # body text, the mark
  ink-muted: "#5f6368"    # secondary text, inactive nav (5.3:1 on paper)
  ink-faint: "#868a8f"    # tag syntax, field keys. 3.0:1 on paper: never for small text that carries meaning
  ribbon: "#5b4a8a"       # spirit-duplicator purple: links, the current page, # lines (6.6:1)
  ribbon-dark: "#43356b"  # link hover
  rule: "#c6cac8"         # hairlines
  code-bg: "#e3e6e4"      # code blocks

typography:
  body:     { fontFamily: "Courier Prime", fontSize: 16px, lineHeight: 1.6 }
  tag:      { fontFamily: "TT2020 Style E", use: "hero tag, page header tags, Savepoint examples in code blocks" }
  heading:  { fontFamily: "TT2020 Style B", textTransform: uppercase, letterSpacing: 0.06em, fontSize: 1rem }
  nav:      { fontFamily: "TT2020 Base", fontSize: 0.85rem }
  mark:     { fontFamily: "TT2020 Style E", fontSize: 1.3rem, text: "<Savepoint/>" }

layout:
  max-width: 980px
  nav-width: 230px
  content-measure: 66ch
  breakpoint: 768px
---

# SavepointProtocol design

Rules for savepointprotocol.org, taken from decisions Peter made between October 29 and November 1, 2026. When a design tool or skill disagrees with this file, this file wins.

## Overview

The site is a typed document: a protocol specification as it would look typed on a machine and duplicated on a spirit copier. The protocol is a typed tag, `<Savepoint ... />`, so the site is made of typed tags.

- **Clean, never distressed.** The paper stays clean. Wear lives only in the letterforms, from the TT2020 faces.
- **Different machines for different jobs.** Heaviest wear (Style E) on tags and the mark, lighter (Style B) on headings, none (Base) on small nav text.
- **One accent.** Ditto purple, and only for links, the current page and the `#` line of a tag.
- **Mode: reading.** This is documentation. Ambition shows as precision and restraint, not spectacle.

Sibling site: aetherwright.com is also a numbered set of documents, treated as a photocopied tract. The two share structure and must not share treatment. Savepoint is quiet, cool and typed. Aetherwright is loud, black and white and copied.

## Colors

Two values do almost all the work: ink on paper. `ink-faint` is for syntax that should recede: the `<Savepoint` and `/>` brackets and field keys like `function:`. It fails contrast for small text, so anything a reader needs to read or click uses `ink-muted` or darker.

Purple marks what's live: links, the page you're on, and the title line of each tag. Nothing decorative is purple.

## Typography

All type is monospaced and typewritten. Body is Courier Prime (Google Fonts). Display is TT2020 by Fredrick Brennan, under the SIL Open Font License, self-hosted and subset to the characters the site uses. If a new character is needed, re-subset the font, or it falls back to Courier Prime.

- Headings are capitals, letterspaced, the size of body text. A typed heading gets its weight from case and spacing, not size.
- TT2020 has no bold. Don't set `font-weight: 700` on TT2020 text, because the browser fakes it. For emphasis, switch to a heavier-worn face or to Courier Prime Bold.
- Sentence case for doc titles and headings in the source. CSS sets the capitals.

## The mark

`<Savepoint/>`, the protocol's own self-closing tag, typed in Style E. It sits in the same place on every page, home included. The favicon is `<S/>`. In the large tags on the page, the brackets are `ink-faint` so they read as syntax and the name reads as the word.

## Components

### Page header tag
Every doc page opens with a typed Savepoint whose fields describe the page (`document:02`, `function:specification`, `protocol_version:3.2`) and whose `#` line is the page title. The home page opens with the protocol's declaration tag. This is the site's signature. Don't add a second tag-shaped element beside it.

### Direction: printed spec sheet (approved in mock, November 1, 2026)
The pages move from a docs-site sidebar to an editorial layout, a specification sheet. Mock: https://claude.ai/artifact/9G8cdnianh4BDqpghhAX8b
- **Running head:** the mark, "SavepointProtocol · version 3.2", and GitHub, over a 1px ink rule.
- **Contents across the top of every page:** all four documents with number and title, the current one in purple under a heavier purple rule. On phones it folds to one "Contents · 02 Syntax" line that opens on tap. Every page must show where the reader is and where else they can go (Peter: "I don't know if a person would know how to navigate this site").
- **Title block:** the document number typed at poster size in Style E is the page's image. Beside it: the `#` title, a one-line dek, and the page's Savepoint as a small colophon.
- **Sections:** a 12-column grid, section marks (§1, §2) and labels in a left margin column, text in a measure.
- **The tag as specimen:** on the Syntax page the canonical tag is set large and each field is selectable, with its definition beside it. It replaces the field table. Field names are dotted-underlined so they read as clickable.
- **Foot:** large previous and next links.

The 1 November critique of the old sidebar (no link to the page header, failing contrast, faked bold, cramped phone grid) is answered by this layout. Rejected along the way: checkbox nav (`[x]` reads as "done"), nav written as a tag (invents syntax), and a small pager as the only nav.

### Code blocks
`code-bg` fill with a 2px `rule` left edge. Savepoint examples inside are set in Style E, like the page tags. Long lines wrap; never scroll sideways.

### Tables
Ink rule top and bottom, hairline `rule` between rows, capitalized header labels.

### Links
Purple, underlined 1px with a 2px offset. Hover darkens to `ribbon-dark`.

## Motion

Added 5 November 2026. The site moves like a typewriter: crisp, short and in steps, never floating. Everything is in the Motion block at the end of `main.scss` and switches off under reduced motion.

- **Home:** the declaration tag is typed in line by line, each line revealed left to right in steps like keys landing. The brackets strike in first and last; the intro settles after.
- **Doc pages:** the poster number strikes in; the title block settles after it. Section rules draw across as each section scrolls into view, and the section mark lands on its rule.
- **Hovers:** colour changes at key-press speed (.15s); link underlines drop to a 4px offset; previous, next and start links nudge 4px toward where they go.
- **Specimen:** the pressed field's arrow slides in and its table row fills in.
- **Phones:** the folded contents open and close smoothly.
- **Page to page:** the running head and contents hold still while the page beneath is swapped in .2s.

## Layout

A 12-column grid in a frame of about 1180px, with a margin column for section marks. Running text holds to 62–66ch. Below 860px everything goes to one column. The `---` rules in the markdown are hidden, and spacing separates sections.

## Do

- Build from what a typed document has: tags, fields, contents pages, document numbers, carbon and ditto copies.
- Keep the paper clean and let the letters carry the wear.
- Check phone layouts at a true 390px (Playwright at `C:\Users\ptsal\tools\shots`).

## Don't

- No paper textures, coffee rings, torn edges or other distressing.
- No second accent color, and no color for decoration.
- No Joinery palette (warm cream, terracotta). It's kept clear of it on purpose.
- No faked bold on TT2020.
- No new tag syntax for UI. Tags on this site are real Savepoints.
- No `ink-faint` on text a reader must read or click.

## Open

- Applying the spec-sheet direction to the home page and the other three docs.
- Darkening `ink-faint`, or limiting it to syntax only, to fix contrast.
- Syntax page: Title Case headings and lowercase "savepoint" still to clean up.
