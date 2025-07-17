# FantoVim - The Neovim IDE

This is my personal Neovim configuration with a set of plugins to enhance the development experience.
This Project is for **WINDOWS 11** only, all configurations are made into this Operational System.

To get help use the command `:Khelp` into the command mode

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


- [catppuccin/nvim](https://github.com/catppuccin/nvim) -  A collection of themes for Neovim.
- [nvimdev/dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) - A dashboard that appears when starting Neovim without a specific file.
- [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) - A plugin to integrate Lazygit into Neovim.
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A status bar to style the Neovim taskbar.
- [OXY2DEV/markview.nvim](https://github.com/OXY2DEV/markview.nvim) - A markdown previewer for Neovim.
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - An LSP manager to install language configurations.
- [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - A file explorer tree.
- [folke/noice.nvim](https://github.com/folke/noice.nvim) - A plugin that replaces the UI for messages, cmdline and popupmenu.
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable fuzzy finder.
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - A plugin to manage terminals inside Neovim.
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - A plugin for code highlighting and indentation.
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine for Neovim.
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) - A plugin to comment code.
- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) - A debug adapter protocol implementation for Neovim.
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for the Neovim LSP client.
- [mfussenegger/nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) - An extension for nvim-lspconfig to configure jdtls.
- [nvim-java/springboot-nvim](https://github.com/nvim-java/springboot-nvim) - A plugin to help with Spring Boot development.
- [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim) - A tabline plugin for Neovim.
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) - A plugin to surround text with pairs of characters.

## Keymaps

### Plugin Keymaps

#### Open basic plugins

| Keybinding | Action | Plugin |
|---|---|---|
| `Ctrl + L` | Open Lazy Git | Lazygit.nvim |
| `Ctrl + F` | Open File System in a Left Window | Neo-tree.nvim |
| `Ctrl + X` | Close Neotree when inactive | Neo-tree.nvim |
| `Ctrl + Q` | Open File Search in Telescope | Telescope.nvim |
| `Ctrl + S` | Open Word Search in Telescope | Telescope.nvim |
| `Ctrl + T` | Open a terminal in a float window | Toggleterm.nvim |
| `Ctrl + G` | Open Gemini CLI from Terminal | Toggleterm.nvim |

#### Code commands

| Keybinding | Action | Plugin |
|---|---|---|
| `Space + D + T` | Debug Toggle Breakpoint | nvim-dap |
| `Space + D + S` | Debug Start | nvim-dap |
| `Space + D + C` | Debug Close | nvim-dap |
| `Space + C + H` | Code Hover Documentation | nvim-lspconfig |
| `Space + C + D` | Code Go to Definition | nvim-lspconfig |
| `Space + C + A` | Code Actions to fix the issue | nvim-lspconfig |
| `Space + C + R` | Code Go to References | nvim-lspconfig |
| `Space + C + I` | Code Go to Implementations | nvim-lspconfig |
| `Space + C + Shift + R` | Code Rename | nvim-lspconfig |
| `Space + C + Shift + D` | Code Go to Declaration | nvim-lspconfig |
| `Space + S + D` | Show Diagnostic of the Warning or Error | nvim-lspconfig |
| `Space + C + F` | Format the code into the specific language | nvim-lspconfig |

#### Spring Boot commands

| Keybinding | Action | Plugin |
|---|---|---|
| `Space + Shift + J + R` | Run Spring Boot | springboot-nvim |
| `Space + Shift + J + C` | Create Java Class | springboot-nvim |
| `Shift + J + I` | Create Java Interface | springboot-nvim |
| `Shift + J + E` | Create Java Enum | springboot-nvim |

#### Tab commands

| Keybinding | Action | Plugin |
|---|---|---|
| `Alt + ,` | Change tab to the previous one | barbar.nvim |
| `Alt + .` | Change tab to the next one | barbar.nvim |
| `Alt + <` | Reorder tabs to the left | barbar.nvim |
| `Alt + >` | Reorder tabs to the right | barbar.nvim |
| `Alt + 1` | Move to tab 1 | barbar.nvim |
| `Alt + 2` | Move to tab 2 | barbar.nvim |
| `Alt + 3` | Move to tab 3 | barbar.nvim |
| `Alt + 4` | Move to tab 4 | barbar.nvim |
| `Alt + 5` | Move to tab 5 | barbar.nvim |
| `Alt + 6` | Move to tab 6 | barbar.nvim |
| `Alt + P` | Pin current tab | barbar.nvim |
| `Alt + C` | Close current tab | barbar.nvim |

#### Comands to surround words

| Keybinding | Action | Plugin
|---|---|---|
| `Y + S + I + W + )` | Surround word with parentheses | nvim-surround |
| `Y + S + $ + "` | Surround from cursor to end of line with double quotes | nvim-surround |
| `D + S + ]` | Delete surrounding brackets | nvim-surround |
| `D + S + T` | Delete surrounding HTML tags | nvim-surround |
| `C + S + ' + "` | Change surrounding single quotes to double quotes | nvim-surround |
| `C + S + T + H + 1 + Enter` | Change surrounding tag to h1 | nvim-surround |
| `D + S + F` | Delete surrounding function call | nvim-surround |

#### Comands to comment lines

| Keybinding | Action | Plugin
|---|---|---|
| `G + C + C` | Comment the current line | Comment.nvim |
| `G + B + C` | Comment the current block | Comment.nvim |
| `G + C + O` | Insert comment next line | Comment.nvim |
| `G + C + Shift + O` | Insert comment previous line | Comment.nvim |
| `G + C + Shift + A` | Insert the comment in the end of current line | Comment.nvim |
| `Ctrl + K` | Previous Suggestions | nvim-cmp |
| `Ctrl + J` | Next Suggestions | nvim-cmp |
| `Ctrl + B` | Scroll docs below | nvim-cmp |
| `Ctrl + Space` | Show completion suggestions | nvim-cmp |
| `Ctrl + F` | Scroll docs above | nvim-cmp |
| `Ctrl + E` | Close completion window | nvim-cmp |
| `Enter` | Confirm Selection | nvim-cmp |

#### Commands to deal with gitsigns

| Keybinding | Action | Plugin
|---|---|---|
|`Space + H + S`| Stage the actual hunk into the index (like git add)|gitsigns
|`Space + H + R`| Undo the actual hunk alterations|gitsigns
|`Space + H + Shift + S` | Stage All changes from the file|gitsigns
|`Space + H + Shift + R` | Undo All changes from the file|gitsigns
|`Space + H + P` | Preview the hunk|gitsigns


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
| Copy multiple lines | `nyy` (where n is the number of lines) |
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
