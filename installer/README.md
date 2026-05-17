# nvim-setup — Go TUI installer

A Bubble Tea / Lipgloss TUI that bootstraps this Neovim configuration on a
fresh Windows machine. Modelled after `clidocs-install`.

## What it does

1. **Welcome screen** with ASCII art + a summary of the install plan.
2. **Prerequisite checks** — verifies Neovim, Git, PowerShell, .NET, Node,
   Python, ripgrep, lazygit, a C compiler, a Nerd Font and netcoredbg.
3. **One-key install** — press `i` to let `winget` install everything that
   is missing (silent / accept agreements).
4. **Destination picker** — default is `%LOCALAPPDATA%\nvim`, with a custom
   directory option.
5. **Backup-aware deploy** — if a config already exists, you can move it to
   `<dest>.backup` before the new files are copied.
6. **Plugin sync** — runs `nvim --headless +Lazy! sync +qa` so the editor is
   fully provisioned the first time you open it.

## Build

Requires Go 1.22 or newer.

```powershell
cd installer
go build -o nvim-setup.exe
```

Run with:

```powershell
.\nvim-setup.exe
```

The installer expects to live next to the rest of the repository, i.e. the
parent directory should contain `init.lua` and `lua/`. If you copy the
executable somewhere else, run it from the repository root (or with `cd`).

## Keyboard map

| Key             | Action                                |
| --------------- | ------------------------------------- |
| `Enter` / `Space` | continue to the next step           |
| `i`             | install missing tools via winget      |
| `↑` / `↓`       | move selection in lists               |
| `Esc`           | back out of custom-path input         |
| `q` / `Ctrl+C`  | quit at any time                      |

## Colour palette

The installer reuses the exact same palette as the editor
(`lua/config/theme.lua`):

| Token            | Hex      | Used for                             |
| ---------------- | -------- | ------------------------------------ |
| `cBg`            | #0d1117  | background                           |
| `cFg`            | #c9d1d9  | primary text (and border colour)     |
| `cMuted`         | #6e7681  | secondary / hint text                |
| `cGreen`         | #3fb950  | OK statuses                          |
| `cYellow`        | #d29922  | warnings                             |
| `cRed`           | #ff7b72  | failures                             |
| `cBlue`          | #58a6ff  | selected items, paths                |
| `cOrange`        | #e8912d  | in-progress states                   |
| `cBorder`        | #c9d1d9  | rounded borders                      |

## Files

| File          | Role                                             |
| ------------- | ------------------------------------------------ |
| `main.go`     | Bubble Tea model + view + step machine           |
| `styles.go`   | Colour palette and helpers (`box`, `sty`)        |
| `checks.go`   | Every prerequisite check + classifiers           |
| `install.go`  | winget runner, file copy, lazy.nvim sync         |
| `go.mod`      | Dependencies (bubbletea, lipgloss)               |
