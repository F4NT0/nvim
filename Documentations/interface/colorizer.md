# Colorizer

Renders colour codes (`#RRGGBB`, `rgb(...)`, CSS names) with their actual colour.

## Overview

`nvim-colorizer.lua` highlights any colour literal in any buffer with its real colour as background. It is the fastest of the colour-preview plugins and is set up across all filetypes so it works for CSS, themes, JSON design tokens or hard-coded values in code. Particularly handy when tweaking the editor palette in `lua/config/theme.lua`.

## Repository

<https://github.com/NvChad/nvim-colorizer.lua>

## Requirements

- A true-colour terminal (`termguicolors` enabled).

## Commands

- `:ColorizerToggle` — turn rendering on/off for the current buffer.
- `:ColorizerAttachToBuffer` — attach manually if a buffer was opened before the plugin loaded.
- `:ColorizerReloadAllBuffers` — refresh every attached buffer.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| _(none)_ | Highlights appear automatically | Triggered on `BufReadPre` / `BufNewFile` |

## Tips

- Set `mode = "foreground"` in the spec if you'd rather see colours applied to the text instead of the background.
- Restrict the plugin to specific filetypes by replacing `filetypes = { "*" }` with a list (e.g. `{ "css", "html", "lua" }`).

> Source: lua/plugins/interface/colorizer.lua
