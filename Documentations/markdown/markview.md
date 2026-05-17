# markview

Inline preview of Markdown documents (headings, lists, callouts, tables, code blocks).

## Overview

`markview.nvim` renders Markdown directly inside the buffer: headings get badges, lists are bulleted with Unicode glyphs, callouts and quote blocks are highlighted, tables are aligned, and links get filetype icons. Hybrid mode keeps the raw Markdown around the cursor while everything else is rendered, so editing still feels natural. Icons come from `nvim-web-devicons`.

## Repository

<https://github.com/OXY2DEV/markview.nvim>

## Requirements

- `nvim-web-devicons` and a Nerd Font for icons and badges.
- Treesitter Markdown parsers (`markdown`, `markdown_inline`) — installed automatically by the treesitter spec.

## Commands

- `:Markview` — toggle the preview.
- `:Markview enable` — turn rendering on.
- `:Markview disable` — turn rendering off.
- `:Markview hybridMode` — toggle hybrid (raw + rendered) mode.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| _(none)_ | Preview renders automatically on Markdown buffers | `ft = { "markdown", "mdx" }` |

## Tips

- The `Khelp` popup (see `helper.lua`) opens `KEYMAPS.md` with markview rendering enabled — great for browsing the manual.
- Press `:Markview hybridMode` while editing if rendered tables make precise edits awkward; hybrid mode falls back to raw text on the active line.

> Source: lua/plugins/markdown/markview.lua
