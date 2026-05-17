# Telescope

Highly extensible fuzzy finder used by file pickers, live grep, LSP and TodoTelescope.

## Overview

Telescope is the workhorse fuzzy finder of this config. It backs `find_files` and `live_grep` (the two main pickers from the dashboard), LSP pickers (`lsp_references`, `lsp_implementations`) and `TodoTelescope`. The companion `telescope-ui-select` extension overrides Neovim's `vim.ui.select` so other plugins (Mason, easy-dotnet, dap, …) show their menus through Telescope. Borders and highlights are themed via `config.theme` for visual consistency.

## Repository

<https://github.com/nvim-telescope/telescope.nvim>

## Requirements

- `plenary.nvim`.
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) on PATH (required by `live_grep` and TodoTelescope).
- [`fd`](https://github.com/sharkdp/fd) is recommended for faster `find_files`.

## Commands

- `:Telescope` — open the picker menu.
- `:Telescope find_files` — fuzzy find files in the cwd.
- `:Telescope live_grep` — grep across the project.
- `:Telescope <builtin>` — any of the built-in pickers (`buffers`, `help_tags`, `lsp_references`, …).

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<C-q>` | Find files | Plugin-local |
| `<C-s>` | Live grep | Plugin-local |
| `<leader>cr` | LSP references via Telescope | Defined in `nvim-lspconfig.lua` (LspAttach) |
| `<leader>ci` | LSP implementations via Telescope | Defined in `nvim-lspconfig.lua` (LspAttach) |

## Tips

- Inside a picker, `<C-/>` (insert) or `?` (normal) shows the active Telescope mappings.
- `node_modules`, `.git/`, `bin/` and `obj/` are excluded from results — extend `file_ignore_patterns` to add your own.

> Source: lua/plugins/interface/telescope.lua
