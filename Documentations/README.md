# Plugin Documentation

Per-plugin reference for the `LNeovim` configuration. Each page documents one plugin: what it does, why it is part of this config, where its spec lives, the commands and keymaps it exposes, and a few usage tips.

Global keymaps that are not bound inside a plugin's own spec are kept in `lua/config/keymaps.lua` (referenced from the relevant docs).

## Interface (13)

- [catppuccin](./interface/catppuccin.md) — Soothing pastel colour scheme themed with the shared palette.
- [dashboard](./interface/dashboard.md) — Start screen with file pickers, lazygit and TODO entries.
- [neo-tree](./interface/neo-tree.md) — File explorer sidebar with git status and follow-current-file.
- [barbar](./interface/barbar.md) — Tabline showing one tab per open buffer (keymaps in `config/keymaps.lua`).
- [lualine](./interface/lualine.md) — Status line themed from the shared palette.
- [telescope](./interface/telescope.md) — Fuzzy finder for files, grep, LSP and `vim.ui.select`.
- [toggleterm](./interface/toggleterm.md) — Floating terminal with `.NET`-aware `:DotnetRun` helpers.
- [devicons](./interface/devicons.md) — Filetype icons shared by every UI plugin.
- [colorizer](./interface/colorizer.md) — Renders colour codes with their actual colour as background.
- [noice](./interface/noice.md) — Modern UI for cmdline, messages and LSP popups.
- [treesitter](./interface/treesitter.md) — Parser-based syntax highlighting and indentation.
- [tiny-inline-diagnostic](./interface/tiny-inline-diagnostic.md) — Compact inline LSP diagnostics.
- [helper (`:Khelp`)](./interface/helper.md) — Floating popup that opens `KEYMAPS.md`.

## LSP (2)

- [mason](./lsp/mason.md) — Installer for LSP servers, formatters and DAP adapters.
- [nvim-lspconfig](./lsp/nvim-lspconfig.md) — Built-in LSP client configuration and `LspAttach` keymaps.

## Debug (1)

- [nvim-dap + nvim-dap-ui](./debug/nvim-dap.md) — Debug Adapter Protocol client wired for `.NET` via `netcoredbg`.

## Programming (9)

- [nvim-cmp](./programming/cmp.md) — Completion engine for LSP, snippets, buffer and path.
- [Comment.nvim](./programming/comment.md) — `gc` / `gb` operators to toggle comments.
- [nvim-surround](./programming/nvim-surround.md) — `ys` / `cs` / `ds` operators for surrounding pairs.
- [indent-blankline](./programming/indent-blankline.md) — Vertical indent guides.
- [todo-comments](./programming/todo-comments.md) — Highlights and lists project-wide TODO / FIX / HACK markers.
- [none-ls](./programming/none-ls.md) — Bridges `stylua`, `prettier`, `csharpier` to the LSP format API.
- [roslyn.nvim](./programming/roslyn.md) — Microsoft's official Roslyn server for C# / Razor.
- [easy-dotnet](./programming/easy-dotnet.md) — Telescope-style menus around the `dotnet` CLI.
- [neotest](./programming/neotest.md) — Test runner framework with the `.NET` adapter.

## Git Manager (2)

- [gitsigns](./git-manager/gitsigns.md) — Hunk indicators, staging, blame and navigation.
- [lazygit](./git-manager/lazygit.md) — Embeds the `lazygit` TUI in a floating window.

## Markdown (1)

- [markview](./markdown/markview.md) — Inline preview of Markdown buffers.

---

> Looking for the full keymap manual? Run `:Khelp` inside Neovim, or open `KEYMAPS.md` at the root of the config.
