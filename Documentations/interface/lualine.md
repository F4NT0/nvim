# Lualine

Status line at the bottom of the editor.

## Overview

Lualine renders the bottom status line in three sections: mode + git branch + filename on the left, diagnostics + file encoding / format / type on the right, and progress / location on the far right. The colour theme is generated from the shared palette in `lua/config/theme.lua` so the bar's accent colour reflects the current mode (normal, insert, visual, replace, command). `globalstatus = true` means a single status line is shown across all windows.

## Repository

<https://github.com/nvim-lualine/lualine.nvim>

## Requirements

- `nvim-web-devicons` and a Nerd Font for filetype / diagnostic icons.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| _(none)_ | Status line updates automatically | — |

## Tips

- The status line is hidden on the dashboard buffer (`disabled_filetypes`) so the start screen stays clean.
- Edit the `sections` table to add custom components — for example `lualine_c` is a good place to show LSP server status or current file path with `path = 1`.

> Source: lua/plugins/interface/lualine.lua
