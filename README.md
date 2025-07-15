# FantoVim - The Neovim IDE

This is my personal Neovim configuration with a set of plugins to enhance the development experience.
This Project is for **WINDOWS 11** only, all configurations are made into this Operational System.

## Directory Organization

The configuration files are organized as follows:

- `init.lua`: The main entry point for the Neovim configuration.
- `lazy-lock.json`:  Manages the installed plugins and their versions.
- `lua/`: Contains all the Lua configuration files.
  - `plugins.lua`:  Loads all the plugins from the `lua/plugins` directory.
  - `config/`: Contains the configuration files for the plugins.
    - `autocmds.lua`:  Contains the autocommands.
    - `jdtls.lua`: Contains the configuration for the Java LSP.
    - `keymaps.lua`: Contains all the keymaps.
  - `plugins/`: Contains the plugin specifications.
    - `init.lua`:  Loads all the plugins from the `lua/plugins` directory.
    - `git-manager/`: Contains the git manager plugins.
    - `interface/`: Contains the interface plugins.
    - `lsp/`: Contains the LSP plugins.
    - `markdown/`: Contains the markdown plugins.
    - `programming/`: Contains the programming plugins.

## Installation

To use this configuration, you need to have Neovim installed on your Windows 11 machine.
The location of the files is in `C:\Users\user\Appdata\Local\nvim`

## Plugins

| Plugin | Description | GitHub URL |
|---|---|---|
| [catppuccin/nvim](https://github.com/catppuccin/nvim) | A collection of themes for Neovim. |
| [nvimdev/dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | A dashboard that appears when starting Neovim without a specific file. |
| [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | A plugin to integrate Lazygit into Neovim. |
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | A status bar to style the Neovim taskbar. |
| [OXY2DEV/markview.nvim](https://github.com/OXY2DEV/markview.nvim) | A markdown previewer for Neovim. |
| [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) | An LSP manager to install language configurations. |
| [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | A file explorer tree. |
| [folke/noice.nvim](https://github.com/folke/noice.nvim) | A plugin that replaces the UI for messages, cmdline and popupmenu. |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | A highly extendable fuzzy finder. |
| [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | A plugin to manage terminals inside Neovim. |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | A plugin for code highlighting and indentation. |
| [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | A completion engine for Neovim. |
| [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) | A plugin to comment code. |
| [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) | A debug adapter protocol implementation for Neovim. |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | A collection of configurations for the Neovim LSP client. |
| [mfussenegger/nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) | An extension for nvim-lspconfig to configure jdtls. |
| [nvim-java/springboot-nvim](https://github.com/nvim-java/springboot-nvim) | A plugin to help with Spring Boot development. |

## Keymaps

### Plugin Keymaps

| Keybinding | Action | Plugin |
|---|---|---|
| `<C-l>` | Open Lazy Git | Lazygit.nvim |
| `<C-f>` | Open File System in a Float Window | Neo-tree.nvim |
| `<C-b>` | Open Git Status from Neotree | Neo-tree.nvim |
| `<C-q>` | Open File Search in Telescope | Telescope.nvim |
| `<C-s>` | Open Word Search in Telescope | Telescope.nvim |
| `<C-t>` | Open a terminal in a float window | Toggleterm.nvim |
| `<C-g>` | Open Gemini CLI from Terminal | Toggleterm.nvim |
| `<leader>dt` | Debug Toggle Breakpoint | nvim-dap |
| `<leader>ds` | Debug Start | nvim-dap |
| `<leader>dc` | Debug Close | nvim-dap |
| `<leader>ch` | Code Hover Documentation | nvim-lspconfig |
| `<leader>cd` | Code Go to Definition | nvim-lspconfig |
| `<leader>ca` | Code Actions to fix the issue | nvim-lspconfig |
| `<leader>cr` | Code Go to References | nvim-lspconfig |
| `<leader>ci` | Code Go to Implementations | nvim-lspconfig |
| `<leader>cR` | Code Rename | nvim-lspconfig |
| `<leader>cD` | Code Go to Declaration | nvim-lspconfig |
| `<leader>sd` | Show Diagnostic of the Warning or Error | nvim-lspconfig |
| `<leader>cf` | Format the code into the specific language | nvim-lspconfig |
| `<leader>Jr` | Run Spring Boot | springboot-nvim |
| `<leader>Jc` | Create Java Class | springboot-nvim |
| `Ji` | Create Java Interface | springboot-nvim |
| `Je` | Create Java Enum | springboot-nvim |

### Basic Neovim Commands

#### Normal Mode (`Esc`)

| Action | Command |
|---|---|
| Move cursor | `h` (left), `j` (down), `k` (up), `l` (right) |
| Save file | `:w` |
| Quit | `:q` |
| Save and quit | `:wq` or `ZZ` |
| Quit without saving | `:q!` |
| Open file | `:e filename` |
| Reload file | `:e!` |
| Split window horizontally | `:split` or `:sp` |
| Split window vertically | `:vsplit` or `:vsp` |
| Move between splits | `Ctrl-w h/j/k/l` |
| Close current split | `:close` |
| Search | `/pattern` |
| Search next/previous | `n` / `N` |
| Replace | `:%s/old/new/g` |
| Undo / Redo | `u` / `Ctrl-r` |
| Copy (yank) line | `yy` |
| Paste | `p` |
| Delete line | `dd` |
| Open file explorer | `:Ex` or `:Explore` |

#### Insert Mode (`i`, `I`, `a`, `A`, `o`, `O`)

| Action | Command |
|---|---|
| Enter insert mode | `i` (before cursor), `a` (after cursor) |
| New line below / above | `o` / `O` |
| Exit insert mode | `Esc` |

#### Visual Mode (`v`, `V`, `Ctrl-v`)

| Action | Command |
|---|---|
| Enter visual mode | `v` (character), `V` (line), `Ctrl-v` (block) |
| Copy selection | `y` |
| Delete selection | `d` |
| Paste over selection | `p` |
| Indent / Unindent | `>` / `<` |
| Exit visual mode | `Esc` |

#### Command Mode (`:`)

| Action | Command |
|---|---|
| Run a command | `:` followed by command (e.g., `:w`, `:q`) |
| Open terminal | `:terminal` |
| Run shell command | `:!command` (e.g., `:!ls`) |

#### Useful Tips

- **Repeat last command**: `.`
- **Record macro**: `q<letter>` (e.g., `qa`), stop with `q`
- **Play macro**: `@<letter>` (e.g., `@a`)
- **Show line numbers**: `:set number`
- **Enable relative numbers**: `:set relativenumber`
- **Toggle paste mode**: `:set paste` / `:set nopaste`
