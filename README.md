<p align="center">
  <img src="https://github.com/F4NT0/nvim-images/blob/7d74d883d35f13207f27b4c4c2a1ac6c7a8fe7eb/neovim_logo.png">
</p>

---

> A personal, batteries-included Neovim IDE focused on **.NET / C#** development on **Windows 11**.
> Cross-platform friendly — the configuration loads on macOS/Linux too, only the .NET tooling is Windows-first.
> Open `:Khelp` inside Neovim to see every keymap, or read [KEYMAPS.md](./KEYMAPS.md).

## Highlights

- **Roslyn-powered C# LSP** with inlay hints, code lens and full-solution analysis.
- **easy-dotnet.nvim** menus for `dotnet run / test / build / restore / watch / secrets`.
- **neotest + neotest-dotnet** for xUnit / NUnit / MSTest with inline results.
- **netcoredbg** debugging via nvim-dap + nvim-dap-ui.
- **Mason** auto-installs every LSP, formatter and linter listed in `lua/plugins/lsp/mason.lua`.
- **GitHub Dark** colour scheme with light, eye-friendly borders across every floating window.
- **Lazy-loaded** plugin specs (`event`, `cmd`, `ft`, `keys`) plus `vim.loader` cache for fast startup.

## Directory layout

| Path                                | Purpose                                                              |
| ----------------------------------- | -------------------------------------------------------------------- |
| `init.lua`                          | Entry point. Sets leader, enables `vim.loader`, loads `config/*`.    |
| `lua/config/options.lua`            | Editor options (indent, UI, providers).                              |
| `lua/config/lazy.lua`               | lazy.nvim bootstrap + performance tuning.                            |
| `lua/config/keymaps.lua`            | Global keymaps (barbar, window movement, todo telescope…).           |
| `lua/config/autocmds.lua`           | Autocommands (yank highlight, last cursor position, trim ws…).       |
| `lua/config/theme.lua`              | Shared colour palette consumed by every plugin spec.                 |
| `lua/plugins/interface/`            | Theme, statusline, tabline, file tree, telescope, terminal, noice…  |
| `lua/plugins/lsp/`                  | Mason, lspconfig, nvim-dap.                                          |
| `lua/plugins/programming/`          | cmp, comment, surround, indent-blankline, todo-comments, none-ls,  |
|                                     | **roslyn + easy-dotnet + neotest** for C#.                           |
| `lua/plugins/git-manager/`          | gitsigns, lazygit.                                                   |
| `lua/plugins/markdown/`             | markview.                                                            |
| `Documentations/`                   | One markdown file per plugin (commands, keymaps, examples).          |
| `installer/`                        | Go TUI installer (Bubble Tea) that provisions a fresh Windows host. |
| `KEYMAPS.md`                        | Reference manual rendered in-editor by `:Khelp`.                     |

## Quick start (existing Neovim install)

```
git clone <this-repo> %LOCALAPPDATA%\nvim
nvim
```

`lazy.nvim` bootstraps itself on the first run and installs every plugin.

## Bootstrap from scratch (Windows)

Use the Go installer that ships with the repository: it checks prerequisites,
copies the configuration to `%LOCALAPPDATA%\nvim`, installs missing tooling
(Neovim, Git, Node, Ripgrep, Lazygit, .NET SDK…) and offers to install a
Nerd Font.

```
cd installer
go build -o nvim-setup.exe
./nvim-setup.exe
```

See [installer/README.md](./installer/README.md) for screenshots and flags.

## Manual prerequisites

If you prefer to install dependencies yourself:

| Tool                    | Install command                                           |
| ----------------------- | --------------------------------------------------------- |
| Neovim ≥ 0.11           | `winget install Neovim.Neovim`                            |
| Git                     | `winget install Git.Git`                                  |
| .NET SDK 8/9            | `winget install Microsoft.DotNet.SDK.9`                   |
| Node.js LTS             | `winget install OpenJS.NodeJS.LTS`                        |
| Python 3                | `winget install Python.Python.3.12`                       |
| ripgrep                 | `winget install BurntSushi.ripgrep.MSVC`                  |
| lazygit                 | `winget install JesseDuffield.Lazygit`                    |
| MSYS2 (for gcc)         | `winget install MSYS2.MSYS2`                              |
| netcoredbg (DAP)        | <https://github.com/Samsung/netcoredbg/releases>          |
| JetBrainsMono Nerd Font | <https://github.com/ryanoasis/nerd-fonts/releases>        |

## Updating

`nvim --headless "+Lazy! sync" +qa` updates every plugin to the latest commit on
its configured branch and refreshes `lazy-lock.json`. Tree-sitter parsers are
updated on demand with `:TSUpdate`.

## License

Personal configuration — feel free to fork and adapt.
