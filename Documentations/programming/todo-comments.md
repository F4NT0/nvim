# todo-comments

Detects, highlights and lists project-wide task comments (TODO, FIX, HACK, …).

## Overview

`todo-comments.nvim` highlights special task markers in source code and lists them across the project. It recognises `FIX:`, `TODO:`, `HACK:`, `WARN:`, `PERF:`, `NOTE:` and `TEST:` (plus common aliases like `FIXME`, `BUG`, `WARNING`, `OPTIM`, `INFO`). Sign-column markers and Telescope integration make it easy to spot and jump to outstanding work.

## Repository

<https://github.com/folke/todo-comments.nvim>

## Requirements

- [`ripgrep`](https://github.com/BurntSushi/ripgrep) on PATH for the search-based commands.
- `plenary.nvim` (declared as a dependency).
- `telescope.nvim` (already part of the config) for the picker.

## Commands

- `:TodoTelescope` — list every TODO across the project in a Telescope picker.
- `:TodoQuickFix` — open all TODOs in the quickfix list.
- `:TodoLocList` — open all TODOs in the location list.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<leader>td` | `:TodoTelescope` — open the project TODO list | Defined in `lua/config/keymaps.lua` |

## Tips

- Comments must be on the standard comment syntax for the language (e.g. `// TODO:`, `# TODO:`, `-- TODO:`).
- Customise icons, colours or extra keywords by editing the `keywords` table — adding `REVIEW = { … }` will make `REVIEW:` markers highlighted automatically.

> Source: lua/plugins/programming/todo-comments.lua
