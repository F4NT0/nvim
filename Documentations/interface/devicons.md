# nvim-web-devicons

Filetype icons shared by every UI plugin in the config.

## Overview

`nvim-web-devicons` is a dependency for Neo-tree, Telescope, lualine, barbar, dashboard, markview and easy-dotnet. The setup adds a few custom icons (C#, Java, PowerShell, Python, Go, AXAML) so the visuals match the rest of the .NET-centric tooling. Without a Nerd Font installed these icons fall back to placeholder glyphs.

## Repository

<https://github.com/nvim-tree/nvim-web-devicons>

## Requirements

- A [Nerd Font](https://www.nerdfonts.com/) (JetBrainsMono NF or FiraCode NF recommended) set as your terminal font.

## Setup file

`lua/plugins/interface/devicons.lua`

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| _(none)_ | Icons render automatically | Loaded lazily by other plugins |

## Tips

- Use `:lua print(vim.inspect(require('nvim-web-devicons').get_icons()))` to discover the icon name for a given filetype.
- Add a custom icon by extending the `set_icon` call: `{ ext = { icon = "", color = "#...", name = "Label" } }`.

> Source: lua/plugins/interface/devicons.lua
