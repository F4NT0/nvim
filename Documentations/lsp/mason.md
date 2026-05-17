# Mason

Portable installer for LSP servers, DAP adapters, linters and formatters.

## Overview

Mason is the package manager that fetches everything language-related the config relies on: LSP servers (`lua_ls`, `yamlls`, `jsonls`, `bashls`, `roslyn`), formatters (`csharpier`, `prettier`, `stylua`) and adapters such as `rzls`. `mason-lspconfig.nvim` bridges Mason names to lspconfig server names so the `vim.lsp.config()` declarations in `nvim-lspconfig.lua` work without manual paths. A second registry (`Crashdummyy/mason-registry`) is added so the `roslyn` and `rzls` packages are available.

## Repository

- <https://github.com/williamboman/mason.nvim>
- <https://github.com/williamboman/mason-lspconfig.nvim>

## Requirements

- `.NET` SDK 8/9 on PATH (`csharpier`, `roslyn` runtime).
- Node.js on PATH (`prettier`, JS/TS language servers).
- PowerShell 7+ / `pwsh` on PATH.
- `git`, `curl`, `tar` and a `gcc` / `clang` compiler are needed to build some Mason packages.

## Commands

- `:Mason` — open the package manager UI.
- `:MasonInstall <pkg>` — install a specific package (e.g. `:MasonInstall roslyn rzls`).
- `:MasonUpdate` — refresh the registries.
- `:MasonUninstall <pkg>` — remove a package.
- `:MasonLog` — open the installer log.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| _(none)_ | Use the `:Mason` UI to manage packages | — |

## Tips

- Mason auto-installs `csharpier`, `prettier` and `stylua` on first startup; check progress with `:Mason` or `:MasonLog`.
- Inside the `:Mason` UI press `g?` for the contextual keymap help (install, update, uninstall, expand, …).

> Source: lua/plugins/lsp/mason.lua
