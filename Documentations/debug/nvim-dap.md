# nvim-dap + nvim-dap-ui

Debug Adapter Protocol client for Neovim, wired to .NET via `netcoredbg`.

## Overview

`nvim-dap` implements the [Debug Adapter Protocol](https://microsoft.github.io/debug-adapter-protocol/)
inside Neovim. `nvim-dap-ui` provides a graphical panel layout (variables,
watches, stack frames, breakpoints, console) that opens automatically when a
debug session starts and closes when it ends.

For .NET projects the adapter is `coreclr`, backed by Samsung's
[netcoredbg](https://github.com/Samsung/netcoredbg) binary.

## Repository

- <https://github.com/mfussenegger/nvim-dap>
- <https://github.com/rcarriga/nvim-dap-ui>

## Requirements

| Dependency | Purpose |
|---|---|
| netcoredbg | .NET debug adapter executable |
| nvim-nio | async runtime required by nvim-dap-ui |

`netcoredbg` must be reachable via the `NETCOREDBG` environment variable **or**
placed at `C:\Tools\netcoredbg\netcoredbg.exe` (the default path in the spec).

The Go TUI installer validates both locations and prints a clear error if
neither is found.

## Setup file

`lua/plugins/lsp/nvim-dap.lua`

The adapter is loaded lazily on `event = "VeryLazy"` so it never delays startup.

## Commands

| Command | Description |
|---|---|
| `:DapContinue` | Start or continue the current debug session |
| `:DapToggleBreakpoint` | Toggle a breakpoint on the current line |
| `:DapStepOver` | Step over the current statement |
| `:DapStepInto` | Step into the current call |
| `:DapStepOut` | Step out of the current function |
| `:DapTerminate` | Terminate the debug session |
| `:DapUIOpen` / `:DapUIClose` | Manually open/close the UI panel |

## Keymaps

| Key | Mode | Action |
|---|---|---|
| `<leader>dt` | n | Toggle breakpoint on current line |
| `<leader>ds` | n | Start / continue the debug session |
| `<leader>dc` | n | Close the dap-ui panel |
| `<leader>do` | n | Step over |
| `<leader>di` | n | Step into |
| `<leader>du` | n | Step out |

## netcoredbg path resolution

The spec checks locations in this order:

1. `$NETCOREDBG` environment variable
2. `C:\Tools\netcoredbg\netcoredbg.exe` (default fallback)

To override, set the environment variable before launching Neovim:

```powershell
$env:NETCOREDBG = "C:\path\to\netcoredbg.exe"
```

## Tips

- The `.dll` path prompt on launch defaults to `<cwd>\bin\Debug\net9.0\`. Adjust
  the `net9.0` part to match your target framework (e.g. `net8.0`).
- Add a `launch.json`-compatible configuration to `dap.configurations.cs` if you
  need more advanced scenarios (attach to process, remote debugging, etc.).
- `nvim-dap-ui` panels are navigable with normal Neovim window commands (`<C-w>`).

> Source: `lua/plugins/lsp/nvim-dap.lua`
