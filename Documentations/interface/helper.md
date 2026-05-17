# Helper (`:Khelp`)

In-editor keymap reference rendered through `nui.nvim`.

## Overview

`nui.nvim` is the component library used internally by Neo-tree, Noice and other UI plugins. This spec also uses it directly to provide a `:Khelp` user command that opens the top-level `KEYMAPS.md` cheat-sheet inside a floating popup. The goal is to make the entire shortcut reference one keystroke away without having to leave Neovim or open the file from disk.

## Repository

<https://github.com/MunifTanjim/nui.nvim>

## Requirements

- A `KEYMAPS.md` (or legacy `Manual.md`) file at the root of the Neovim config (`$XDG_CONFIG_HOME/nvim`).

## Commands

- `:Khelp` — open the keymap manual in a 80% × 85% floating popup.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `:Khelp` | Open the keymap manual | Also listed on the dashboard |

## Tips

- The popup auto-closes when it loses focus (`BufLeave`), so navigating to another window dismisses it cleanly.
- Edit `KEYMAPS.md` in the config root to customise what appears in the popup — it's just a plain Markdown file.

> Source: lua/plugins/interface/helper.lua
