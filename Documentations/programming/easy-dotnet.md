# easy-dotnet

Telescope-style menus for the everyday `dotnet` CLI workflow.

## Overview

`easy-dotnet.nvim` wraps the `dotnet` CLI in Telescope-driven menus: run, build, test, restore, watch, manage user-secrets, scaffold from templates, work with EF Core migrations and inspect NuGet packages. It is paired with a custom `terminal` callback that opens each command in a vertical split so output stays visible while you keep coding.

## Repository

<https://github.com/GustavEikaas/easy-dotnet.nvim>

## Requirements

- `.NET` SDK on PATH.
- `plenary.nvim` and `telescope.nvim` (declared as dependencies).
- A Nerd Font for the test runner icons.

## Commands

- `:Dotnet run` — pick a project and run it.
- `:Dotnet test` — run `dotnet test` with selectable filters.
- `:Dotnet build` — build the solution or project.
- `:Dotnet restore` — restore NuGet packages.
- `:Dotnet secrets` — manage `dotnet user-secrets`.
- `:Dotnet ef` — EF Core migrations workflow.
- `:Dotnet new` — scaffold a project from a template.
- `:Dotnet watch` — `dotnet watch`.
- `:Dotnet outdated` — list outdated NuGet packages.
- `:DotnetUI` — open the unified picker UI.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<leader>nd` | `:Dotnet run` | Plugin-local |
| `<leader>nt` | `:Dotnet test` | Plugin-local |
| `<leader>nb` | `:Dotnet build` | Plugin-local |
| `<leader>nr` | `:Dotnet restore` | Plugin-local |
| `<leader>ns` | `:Dotnet secrets` | Plugin-local |

## Tips

- `:Dotnet test` opens the test runner in a floating window; press `?` inside it for the buffer-local keymaps (run, debug, refresh, jump to source).
- The terminal callback sends commands via `vsplit | terminal`, so `<C-w>q` closes the run output without affecting your code window.

> Source: lua/plugins/programming/easy-dotnet.lua
