# Neo-tree

File explorer sidebar with git status, buffers and filesystem operations.

## Overview

Neo-tree is the project tree on the left side of the editor. It exposes the filesystem, git status and buffer sources, follows the currently open file and watches the directory through libuv. Hidden / git-ignored files are visible by default so config and dotfile editing remains fast. Custom highlights pull colours from `config.theme` so the sidebar matches the rest of the UI, including dedicated colours for added / modified / deleted / untracked entries.

## Repository

<https://github.com/nvim-neo-tree/neo-tree.nvim>

## Requirements

- `plenary.nvim`, `nui.nvim`, `nvim-web-devicons`.
- A Nerd Font for filetype and git status icons.

## Commands

- `:Neotree` — open the tree (accepts `filesystem`, `buffers`, `git_status`, `reveal`, `left`, `close`, …).
- `:Neotree filesystem reveal left` — open the explorer and reveal the current file.
- `:Neotree close` — close the explorer.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<C-f>` | Open file explorer and reveal current file | Plugin-local |
| `<C-x>` | Close file explorer | Plugin-local |

## Tips

- Once inside the tree, press `?` to see Neo-tree's own buffer-local keymaps (`a` add, `d` delete, `r` rename, `c` copy, `m` move, `H` toggle hidden, …).
- The popup uses 60% width / 85% height — adjust `window.popup.size` in the spec if you prefer a smaller floating window.

> Source: lua/plugins/interface/neotree.lua
