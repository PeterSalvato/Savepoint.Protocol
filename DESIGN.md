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

### Navigation (under revision)
The current nav is a numbered list in a 230px sidebar. Peter called it "lazy and somewhat boring." A critique on November 1, 2026 found:
- It doesn't connect to the page header. The nav numbers pages 01–04 and the header types `document:02`, but nothing links them visually.
- Numbers and the GitHub link use `ink-faint` and fail contrast.
- The current page is marked by color and a faked bold.
- On phones, a 2-column grid with an ambiguous reading order, small tap targets, and 210px of nav above the content.

Direction under consideration: a typed contents page (title, dot leaders, document number), keyed to the `document:` field. Rejected: checkbox form (`[x]` reads as "done") and nav written as a tag (invents syntax that isn't Savepoint).

### Code blocks
`code-bg` fill with a 2px `rule` left edge. Savepoint examples inside are set in Style E, like the page tags. Long lines wrap; never scroll sideways.

### Tables
Ink rule top and bottom, hairline `rule` between rows, capitalized header labels.

### Links
Purple, underlined 1px with a 2px offset. Hover darkens to `ribbon-dark`.

## Layout

Sidebar and content in a 980px frame. Running text holds to 66ch. Below 768px the sidebar stacks above the content. The `---` rules in the markdown are hidden, and spacing separates sections.

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

- Navigation design (see Navigation).
- Darkening `ink-faint`, or limiting it to syntax only, to fix contrast.
- Syntax page: Title Case headings and lowercase "savepoint" still to clean up.
