# gitsigns

Hunk indicators, staging, blame and navigation for Git-tracked buffers.

## Overview

`gitsigns.nvim` renders add / change / delete markers in the sign column, provides per-hunk staging and reset, line / buffer blame, and feeds git status data to Neo-tree, lualine and barbar. Buffer-local keymaps are set up on attach so the shortcuts work only when the file is inside a git repository. Hunk previews and inline blame popups use rounded borders for consistency with the rest of the UI.

## Repository

<https://github.com/lewis6991/gitsigns.nvim>

## Requirements

- `git` on PATH.

## Commands

- `:Gitsigns` — main command (subcommands: `stage_hunk`, `reset_hunk`, `preview_hunk`, `blame_line`, `toggle_current_line_blame`, `diffthis`, …).

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<leader>hs` | Stage hunk under cursor | Buffer-local (on attach) |
| `<leader>hr` | Reset (undo) hunk | Buffer-local (on attach) |
| `<leader>hS` | Stage entire buffer | Buffer-local (on attach) |
| `<leader>hR` | Reset entire buffer | Buffer-local (on attach) |
| `<leader>hp` | Preview hunk | Buffer-local (on attach) |
| `<leader>hb` | Blame current line (full info) | Buffer-local (on attach) |
| `]c` | Jump to next hunk | Buffer-local (on attach) |
| `[c` | Jump to previous hunk | Buffer-local (on attach) |

## Tips

- Turn on inline blame for everyone by setting `current_line_blame = true` in the setup table — useful when reviewing legacy code.
- `:Gitsigns diffthis` opens a side-by-side diff against the index — fast way to review what's about to be committed.

> Source: lua/plugins/git-manager/gitsigns.lua
