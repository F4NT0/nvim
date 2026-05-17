# nvim-treesitter

Syntax highlighting and indentation engine based on incremental parsing.

## Overview

Treesitter replaces Vim's regex-based highlighting with proper parsers. Parsers for every language the config targets (Lua, C#, Java, Go, Rust, Python, PowerShell, JS/TS, HTML/CSS, JSON/YAML/TOML, Markdown, …) are auto-installed on first launch. `auto_install = true` keeps the list up to date for any new filetype you open. Incremental selection is wired to `<C-Space>` / `<bs>`.

## Repository

<https://github.com/nvim-treesitter/nvim-treesitter>

## Requirements

- A C compiler (`gcc` or `clang`) reachable on PATH for parser builds.
- `tree-sitter-cli` is recommended for on-the-fly parser installation.
- `git` on PATH.

## Commands

- `:TSUpdate` — rebuild every installed parser.
- `:TSInstall <lang>` — install a parser for a specific language.
- `:TSInstallInfo` — list parsers and their install state.
- `:TSUpdateSync` — synchronous variant of `:TSUpdate` (useful in CI).

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<C-Space>` | Start / expand incremental selection | Plugin-local |
| `<BS>` | Shrink incremental selection | Plugin-local |

## Tips

- Run `:checkhealth nvim-treesitter` to confirm every parser is installed and your toolchain is recognised.
- Use `:TSPlaygroundToggle` (with the optional playground extension) to inspect the parse tree of any buffer.

> Source: lua/plugins/interface/treesitter.lua
