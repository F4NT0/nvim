# Comment.nvim

Language-aware toggling of single-line and block comments.

## Overview

`Comment.nvim` adds the canonical `gc` / `gb` operators for toggling comments in any language Treesitter (or the standard `commentstring` option) knows about. It is configured with all defaults so the muscle memory carries over from Vim and other editors.

## Repository

<https://github.com/numToStr/Comment.nvim>

## Requirements

- Treesitter (already part of the config) provides accurate `commentstring` detection per filetype.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `gcc` | Toggle current line comment | Plugin default |
| `gbc` | Toggle current block comment | Plugin default |
| `gc{motion}` | Toggle line comment over a motion (e.g. `gcap`) | Plugin default |
| `gb{motion}` | Toggle block comment over a motion | Plugin default |
| `gco` | Add a comment line below | Plugin default |
| `gcO` | Add a comment line above | Plugin default |
| `gcA` | Add a comment at end of current line | Plugin default |
| `gc` (visual) | Toggle comment on the visual selection | Plugin default |

## Tips

- Use `gcip` (line) or `gbip` (block) to toggle commenting on the inner paragraph.
- For mixed-language files (e.g. Vue, Razor, Astro) install `JoosepAlviste/nvim-ts-context-commentstring` to pick the right comment character based on the cursor's Treesitter context.

> Source: lua/plugins/programming/comment.lua
