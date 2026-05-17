# indent-blankline (ibl)

Subtle vertical guides at every indentation level.

## Overview

`indent-blankline.nvim` (loaded under the `ibl` module) draws a thin vertical character at every indent level so it is immediately obvious where blocks start and end. Scope highlighting picks out the indent the cursor is currently inside. Colours come from `config.theme` so the guides stay readable on the GitHub Dark background. The plugin is skipped on UI filetypes (`dashboard`, `lazy`, `mason`, `neo-tree`, `help`, `checkhealth`) so they remain visually clean.

## Repository

<https://github.com/lukas-reineke/indent-blankline.nvim>

## Requirements

- A true-colour terminal (`termguicolors`).

## Commands

- `:IBLToggle` — turn indent guides on/off globally.
- `:IBLToggleScope` — toggle the scope highlighting only.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| _(none)_ | Guides render automatically | Triggered on `BufReadPost` / `BufNewFile` |

## Tips

- Tweak the `indent.char` option to `▏`, `┊` or `·` if you want a thinner / dotted guide.
- Add a filetype to `exclude.filetypes` if its rendering conflicts with indent guides.

> Source: lua/plugins/programming/indent-blankline.lua
