# Barbar

Tabline at the top of the editor — every open buffer becomes a tab.

## Overview

Barbar turns the tabline into a buffer bar with diagnostics indicators, gitsigns markers, filetype icons and pin support. Tabs animate when reordered and a small sidebar offset keeps the bar from overlapping the Neo-tree window. All shortcuts are mapped globally inside `lua/config/keymaps.lua`, so they remain consistent regardless of buffer focus.

## Repository

<https://github.com/romgrk/barbar.nvim>

## Requirements

- `gitsigns.nvim` (already part of the config) for hunk indicators.
- `nvim-web-devicons` and a Nerd Font for the filetype glyphs.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `Alt + ,` | Previous tab | Defined in `lua/config/keymaps.lua` |
| `Alt + .` | Next tab | Defined in `lua/config/keymaps.lua` |
| `Alt + <` | Move current tab left | Defined in `lua/config/keymaps.lua` |
| `Alt + >` | Move current tab right | Defined in `lua/config/keymaps.lua` |
| `Alt + 1` … `Alt + 6` | Jump to tab 1..6 | Defined in `lua/config/keymaps.lua` |
| `Alt + p` | Pin / unpin current tab | Defined in `lua/config/keymaps.lua` |
| `Alt + c` | Close current tab | Defined in `lua/config/keymaps.lua` |

## Tips

- Use `:BufferPick` (no default mapping) to jump to any visible tab with a single letter prompt.
- The `sidebar_filetypes = { ["neo-tree"] = … }` option keeps the explorer's column reserved so the tabline does not jump when toggling Neo-tree.

> Source: lua/plugins/interface/barbar.lua
