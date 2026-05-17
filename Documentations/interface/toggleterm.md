# ToggleTerm

Floating terminal manager with .NET-aware helper commands.

## Overview

ToggleTerm gives Neovim a fast floating terminal. This config opens it with `<C-t>` (PowerShell shell on Windows) and adds two `.NET`-aware user commands so you can run / kill `dotnet run` against the current C# file without leaving the editor. A persistent hidden terminal is reused for the .NET output so consecutive runs stack neatly.

## Repository

<https://github.com/akinsho/toggleterm.nvim>

## Requirements

- A shell on PATH (`powershell.exe` on Windows, configured in the spec).
- The `.NET` SDK on PATH for `:DotnetRun`.

## Commands

- `:ToggleTerm` — toggle the default floating terminal (same as `<C-t>`).
- `:TermExec cmd="…"` — run a command inside a terminal.
- `:DotnetRun [args]` — `dotnet run <current file>` in a dedicated terminal.
- `:TermDotnetClose` — close the persistent .NET terminal.
- `:TermClose` — close the default toggleable terminal.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<C-t>` | Toggle floating terminal | Plugin-local |
| `<leader>d` | `:DotnetRun` on the current file | Plugin-local |
| `<leader>x` | Close the .NET terminal | Plugin-local |
| `<leader>ct` | Close the default terminal | Plugin-local |

## Tips

- Inside the terminal, press `<C-\><C-n>` to drop into normal mode and copy text with the usual motions.
- `:DotnetRun -- --flag value` appends extra arguments after the `--` separator to `dotnet run`.

> Source: lua/plugins/interface/terminal.lua
