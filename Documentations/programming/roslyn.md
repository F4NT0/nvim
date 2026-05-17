# roslyn.nvim

Drives Microsoft's official Roslyn language server for C# / Razor / cshtml.

## Overview

`roslyn.nvim` replaces OmniSharp with Microsoft's official Roslyn language server — the same engine that powers Visual Studio and the C# DevKit for VS Code. This config enables inlay hints (types, lambda parameters, parameter names…), code lens (references, tests), full-solution background analysis and Razor support. Capabilities are widened with `cmp-nvim-lsp` so completion stays in sync.

## Repository

<https://github.com/seblyng/roslyn.nvim>

## Requirements

- `.NET` SDK 8 or newer on PATH.
- `roslyn` (and `rzls` for Razor) installed via Mason — the spec registers the `Crashdummyy/mason-registry` registry that exposes them.
- `cmp-nvim-lsp` for completion capabilities.

## Setup file

`lua/plugins/programming/roslyn.lua`

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<leader>ch` / `<leader>cd` / `<leader>ca` / `<leader>cR` | Hover / Definition / Code action / Rename | Defined in `nvim-lspconfig.lua` (LspAttach) |
| `<leader>cr` / `<leader>ci` | References / Implementations | Defined in `nvim-lspconfig.lua` (LspAttach) |
| `<leader>cf` | Format buffer | Defined in `nvim-lspconfig.lua` (LspAttach) — relies on `csharpier` via none-ls |

## Tips

- The plugin notifies "Roslyn LSP attached" on first attach — if it never appears, check `:Mason` for the `roslyn` package and the .NET SDK version on PATH.
- Set `broad_search = true` or `lock_target = true` in the setup table when working with multi-solution workspaces and Roslyn picks the wrong target.

> Source: lua/plugins/programming/roslyn.lua
