# nvim-surround

Add, change and delete surrounding characters (quotes, brackets, tags, function calls).

## Overview

`nvim-surround` is the Lua rewrite of Tim Pope's classic `vim-surround`. It defines the `ys` / `cs` / `ds` operators to add, change or delete surrounds and supports HTML tags, function calls and arbitrary delimiters. Default mappings are kept.

## Repository

<https://github.com/kylechui/nvim-surround>

## Requirements

- Neovim ≥ 0.9.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `ys{motion}{char}` | Add surround (e.g. `ysiw)` → `(word)`) | Plugin default |
| `yss{char}` | Surround the whole line | Plugin default |
| `cs{old}{new}` | Change surround (`cs'"` swaps `'` for `"`) | Plugin default |
| `ds{char}` | Delete surround (`ds]`, `dst`, `dsf`, …) | Plugin default |
| `S{char}` (visual) | Surround the visual selection | Plugin default |

## Tips

- HTML tags use `t` for plain tags and `T` for tags with attributes — `cst<h1>` rewraps the current tag as `<h1>...</h1>`.
- Combine with treesitter text objects (`ip`, `if`, `ic`) for context-aware surrounds, e.g. `ysif)` to wrap a whole function in parentheses.

> Source: lua/plugins/programming/nvim-surround.lua
