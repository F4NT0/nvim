# tiny-inline-diagnostic

Compact inline rendering for LSP diagnostics.

## Overview

`tiny-inline-diagnostic.nvim` redraws LSP diagnostics next to the offending code with a clean, arrow-style overlay instead of the default `virtual_text`. It shows the source server, supports multiple diagnostics under the cursor and softly wraps long messages. The plugin disables Neovim's default `virtual_text` so diagnostics are never rendered twice.

## Repository

<https://github.com/rachartier/tiny-inline-diagnostic.nvim>

## Requirements

- Neovim ≥ 0.10.
- An attached LSP server (loads on the `LspAttach` event).

## Setup file

`lua/plugins/interface/inline-diagnostic.lua`

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<leader>sd` | Open diagnostic float for the current line | Defined in `nvim-lspconfig.lua` (LspAttach) |
| `<leader>dl` | Send diagnostics to the location list | Defined in `nvim-lspconfig.lua` (LspAttach) |

## Tips

- Use the `preset` option (`"modern"`, `"classic"`, `"minimal"`, `"powerline"`, …) to switch the visual style.
- Set `options.multilines.always_show = true` if you want every detail expanded by default instead of only under the cursor.

> Source: lua/plugins/interface/inline-diagnostic.lua
