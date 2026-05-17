# Catppuccin

Soothing pastel colour scheme — the editor theme that ties the whole config together.

## Overview

Catppuccin is the active colour scheme for this configuration. It is loaded with priority `1000` so it is available before any other plugin draws on the screen. We start from the `mocha` flavour and override the `base` / `mantle` / `crust` colours with the shared palette in `lua/config/theme.lua`, so the editor matches the GitHub Dark tones used by the installer and the surrounding tooling. Integrations are explicitly enabled for every plugin in the config (cmp, gitsigns, telescope, neo-tree, noice, dap, etc.) so they all get coordinated highlights.

## Repository

<https://github.com/catppuccin/nvim>

## Requirements

- A true-colour terminal (`termguicolors`).
- A Nerd Font for the icons used by the integrations.

## Setup file

`lua/plugins/interface/catppuccin.lua`

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| _(none)_ | Theme is applied automatically on startup | `vim.cmd.colorscheme("catppuccin")` |

## Tips

- Tweak `lua/config/theme.lua` to retune backgrounds, borders or git colours — every plugin that reads from `config.theme` (lualine, neo-tree, telescope, noice, ibl, dap, cmp) will follow.
- Set `transparent_background = true` in the spec if you want your terminal background to show through.

> Source: lua/plugins/interface/catppuccin.lua
