# Dashboard

Start screen displayed when Neovim is launched without arguments.

## Overview

`dashboard-nvim` (Doom theme) is the landing page of the configuration. It greets the user with the `LNEOVIM` ASCII banner, the current date and a shortlist of common actions — finding files, searching for text, opening the file explorer, launching LazyGit and listing every TODO comment in the project. The dashboard makes the most-used pickers reachable in a single keystroke right after startup.

## Repository

<https://github.com/nvimdev/dashboard-nvim>

## Requirements

- `nvim-web-devicons` and a Nerd Font for the entry icons.
- Telescope, Neo-tree, lazygit.nvim and todo-comments.nvim for the corresponding entries.

## Setup file

`lua/plugins/interface/dashboard.lua`

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `Ctrl + Q` | Find a file (`Telescope find_files`) | Dashboard entry only |
| `Ctrl + S` | Search a word (`Telescope live_grep`) | Dashboard entry only |
| `Ctrl + F` | Browse all files (`Neotree filesystem left`) | Dashboard entry only |
| `Ctrl + L` | Open LazyGit (`LazyGit`) | Dashboard entry only |
| `Space + T + D` | Show TODO list (`TodoTelescope`) | Defined in `lua/config/keymaps.lua` |
| `:Khelp` | Open the keymap manual | Provided by `helper.lua` |

## Tips

- The footer shows the current date/time at startup — close and reopen Neovim to refresh it.
- Edit the `center` table in the spec to add or remove entries; each item needs an `icon`, `desc`, `key` and `action`.

> Source: lua/plugins/interface/dashboard.lua
