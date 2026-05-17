# nvim-dap

Debug Adapter Protocol client with a graphical UI (nvim-dap-ui), wired for .NET.

## Overview

`nvim-dap` is the debugger front-end and `nvim-dap-ui` builds a graphical layout (scopes, watches, breakpoints, stack, REPL) around it. The configuration registers a `coreclr` adapter pointing at `netcoredbg.exe` (overridable via the `NETCOREDBG` environment variable) and a `.cs` launch configuration that prompts for the DLL path. Custom signs and colours are applied for breakpoints, rejected breakpoints and the current execution line. The UI opens/closes automatically with the debug session lifecycle.

## Repository

- <https://github.com/mfussenegger/nvim-dap>
- <https://github.com/rcarriga/nvim-dap-ui>

## Requirements

- `.NET` SDK 8/9 on PATH.
- [`netcoredbg`](https://github.com/Samsung/netcoredbg/releases) installed locally (default expected path: `C:\Tools\netcoredbg\netcoredbg.exe`, or set `$env:NETCOREDBG`).
- `nvim-nio` (declared as a dependency).

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<leader>dt` | Toggle breakpoint | Plugin-local |
| `<leader>ds` | Start / continue | Plugin-local |
| `<leader>dc` | Close debug UI | Plugin-local |
| `<leader>do` | Step over | Plugin-local |
| `<leader>di` | Step into | Plugin-local |
| `<leader>du` | Step out | Plugin-local |

## Tips

- Build your project once (`:Dotnet build`) before starting a session so the DLL path you enter actually exists.
- For convenience, mix nvim-dap with neotest: set a breakpoint, then run `<leader>tn` and choose "Debug" to step through the nearest test.

> Source: lua/plugins/lsp/nvim-dap.lua
