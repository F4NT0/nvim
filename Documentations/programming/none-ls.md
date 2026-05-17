# none-ls

Injects external formatters and linters into Neovim's LSP infrastructure.

## Overview

`none-ls.nvim` (the maintained fork of `null-ls`) exposes standalone CLI tools as if they were LSP servers. The configuration enables `stylua` (Lua formatter), `prettier` (JS/TS/JSON/YAML/Markdown formatter) and `csharpier` (C# formatter), all installed automatically by Mason. With these registered, `vim.lsp.buf.format()` and `<leader>cf` work uniformly across every supported language.

## Repository

<https://github.com/nvimtools/none-ls.nvim>

## Requirements

- Mason-installed binaries on PATH: `stylua`, `prettier`, `csharpier`.
- `plenary.nvim` and `none-ls-extras.nvim` (declared as dependencies).

## Setup file

`lua/plugins/programming/none-ls.lua`

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<leader>cf` | Format current buffer (`vim.lsp.buf.format`) | Defined in `nvim-lspconfig.lua` (LspAttach) |

## Tips

- Add more sources by appending to the `sources` table — for example `null_ls.builtins.diagnostics.eslint_d` to get JS linting.
- Use `:NullLsInfo` to inspect which sources are attached to the current buffer.

> Source: lua/plugins/programming/none-ls.lua
