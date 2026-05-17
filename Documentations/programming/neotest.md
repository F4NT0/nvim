# neotest

Generic test runner framework with a .NET adapter (xUnit, NUnit, MSTest).

## Overview

`neotest` is the test runner orchestrator. Combined with `neotest-dotnet`, it discovers xUnit, NUnit and MSTest test classes in the current solution and lets you run / debug them at three granularities: nearest test, current file, whole project. Results are summarised in a side panel and detailed output can be opened on demand. The dap argument `justMyCode = false` lets the debugger step into framework code when needed.

## Repository

- <https://github.com/nvim-neotest/neotest>
- <https://github.com/Issafalcon/neotest-dotnet>

## Requirements

- `.NET` SDK on PATH.
- `plenary.nvim`, `nvim-nio`, `FixCursorHold.nvim`, `nvim-treesitter` (declared as dependencies).
- `nvim-dap` + `netcoredbg` for "Debug" support.

## Commands

- `:Neotest` — main neotest command (subcommands: `run`, `summary`, `output`, `output-panel`, `stop`, …).

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<leader>tn` | Run nearest test | Plugin-local |
| `<leader>tf` | Run every test in the current file | Plugin-local |
| `<leader>ta` | Run every test in the project | Plugin-local |
| `<leader>ts` | Toggle the test summary panel | Plugin-local |
| `<leader>to` | Open the output of the last run | Plugin-local |

## Tips

- Inside the summary panel, press `?` for the buffer-local keymaps (run, debug, expand, jump to source, mark, …).
- Set a breakpoint with `<leader>dt` first, then select "Debug" from the neotest run prompt to start a debugging session via nvim-dap.

> Source: lua/plugins/programming/neotest.lua
