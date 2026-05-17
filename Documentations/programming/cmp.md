# nvim-cmp

Completion engine driving LSP, snippet, buffer and path completions.

## Overview

`nvim-cmp` is the completion engine, wired with four sources: `cmp-nvim-lsp` for LSP completions, `cmp-buffer` for words in open buffers, `cmp-path` for filesystem paths and `cmp_luasnip` for snippets. LuaSnip pulls VSCode-style snippets from `friendly-snippets`. Completion / documentation popups use rounded borders to match the rest of the editor.

## Repository

- <https://github.com/hrsh7th/nvim-cmp>
- <https://github.com/L3MON4D3/LuaSnip>

## Requirements

- LuaSnip and `friendly-snippets` (declared as dependencies).
- On non-Windows platforms, `make` + a C toolchain to build `jsregexp` for LuaSnip.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<C-k>` | Select previous completion item | Insert mode (cmp) |
| `<C-j>` | Select next completion item | Insert mode (cmp) |
| `<C-b>` | Scroll docs up | Insert mode (cmp) |
| `<C-f>` | Scroll docs down | Insert mode (cmp) |
| `<C-Space>` | Trigger completion manually | Insert mode (cmp) |
| `<C-e>` | Abort completion | Insert mode (cmp) |
| `<CR>` | Confirm selected item (no auto-select) | Insert mode (cmp) |

## Tips

- Source priorities (`nvim_lsp` > `luasnip` > `buffer` > `path`) make sure LSP suggestions sit on top of the menu.
- LuaSnip jumps are not bound here — add `<Tab>` / `<S-Tab>` mappings in the `mapping` table if you want snippet placeholder navigation.

> Source: lua/plugins/programming/cmp.lua
