# nvim-lspconfig

Per-server configuration helpers for Neovim's built-in LSP client.

## Overview

`nvim-lspconfig` provides sane defaults for every LSP server we use (`lua_ls`, `yamlls`, `jsonls`, `bashls`, `roslyn`) and is configured here with the new `vim.lsp.config()` / `vim.lsp.enable()` APIs from Neovim 0.11. Capabilities are widened through `cmp-nvim-lsp` so the server is aware of completion features. Diagnostic icons, rounded borders for hover / signature help, and the `<leader>c…` / `<leader>s…` / `<leader>d…` keymaps are all set up here on the `LspAttach` event so they only activate when a buffer actually has an LSP attached.

## Repository

<https://github.com/neovim/nvim-lspconfig>

## Requirements

- Neovim ≥ 0.11.
- Servers installed via Mason (see [mason.md](./mason.md)).
- `cmp-nvim-lsp` for completion-aware capabilities.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<leader>ch` | Hover documentation (`vim.lsp.buf.hover`) | LspAttach (per-buffer) |
| `<leader>cd` | Go to definition (`vim.lsp.buf.definition`) | LspAttach (per-buffer) |
| `<leader>ca` | Code actions (`vim.lsp.buf.code_action`) | LspAttach (per-buffer) |
| `<leader>cr` | References (Telescope) | LspAttach (per-buffer) |
| `<leader>ci` | Implementations (Telescope) | LspAttach (per-buffer) |
| `<leader>cR` | Rename symbol (`vim.lsp.buf.rename`) | LspAttach (per-buffer) |
| `<leader>cD` | Goto declaration (`vim.lsp.buf.declaration`) | LspAttach (per-buffer) |
| `<leader>cf` | Format buffer (`vim.lsp.buf.format`, async) | LspAttach (per-buffer) |
| `<leader>sd` | Show diagnostic float on current line | LspAttach (per-buffer) |
| `<leader>dl` | Send diagnostics to the location list | LspAttach (per-buffer) |

## Tips

- Run `:LspInfo` (lspconfig command) to inspect which clients are attached to the current buffer.
- `virtual_text` is intentionally disabled — diagnostics are rendered by `tiny-inline-diagnostic.nvim` instead.

> Source: lua/plugins/lsp/nvim-lspconfig.lua
