# Noice

Modern UI for the cmdline, messages and LSP popups.

## Overview

`noice.nvim` overrides Neovim's command line, message area and LSP hover / signature help with cleaner, modal-style popups. The cmdline appears as a centred popup, search is shown at the bottom, long messages can be split into their own buffer, and LSP markdown documentation gets rounded borders. Paired with `nvim-notify`, it produces stylised toast notifications for diagnostics and plugin events.

## Repository

<https://github.com/folke/noice.nvim>

## Requirements

- `nui.nvim` and `nvim-notify` (declared as dependencies).
- Neovim ≥ 0.9.

## Commands

- `:Noice` — open the message history.
- `:Noice dismiss` — clear all active notifications.
- `:Noice errors` — show recent errors only.
- `:NoiceLast` — re-show the last notification.
- `:NoiceStats` — show internal performance stats.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| _(none)_ | Replaces the default cmdline / messages UI | — |

## Tips

- `"written"` save messages are filtered out via the `routes` table — add more filters there to silence noisy plugins.
- If a popup ever feels stuck, run `:Noice dismiss` to clear everything in one go.

> Source: lua/plugins/interface/noice.lua
