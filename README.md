
# FantoVim - The Neovim IDE

- This is my personal Neovim configuration with a set of plugins to enhance the development experience.
- This Project is for **WINDOWS 11** only, all configurations are made into this Operational System.
- The location of the files is in `C:\Users\user\Appdata\Local\nvim`

## Plugins

---

| Plugin | Description | GitHub URL |
|---|---|---|
| Catppuccin | A collection of themes for Neovim. | https://github.com/catppuccin/catppuccin |
| Dashboard-nvim | A dashboard that appears when starting Neovim without a specific file. | https://github.com/nvimdev/dashboard-nvim |
| Lazygit.nvim | A plugin to integrate Lazygit into Neovim. | https://github.com/kdheepak/lazygit.nvim |
| Lualine.nvim | A status bar to style the Neovim taskbar. | https://github.com/nvim-lualine/lualine.nvim |
| Markview.nvim | A markdown previewer for Neovim. | https://github.com/OXY2DEV/markview.nvim |
| Mason.nvim | An LSP manager to install language configurations. | https://github.com/williamboman/mason.nvim |
| Neo-tree.nvim | A file explorer tree. | https://github.com/nvim-neo-tree/neo-tree.nvim |
| Noice.nvim | A plugin that replaces the UI for messages, cmdline and popupmenu. | https://github.com/folke/noice.nvim |
| Telescope.nvim | A highly extendable fuzzy finder. | https://github.com/nvim-telescope/telescope.nvim |
| Toggleterm.nvim | A plugin to manage terminals inside Neovim. | https://github.com/akinsho/toggleterm.nvim |
| Nvim-treesitter | A plugin for code highlighting and indentation. | https://github.com/nvim-treesitter/nvim-treesitter |

## My Personal Commands

---

| Keybinding | Action | Plugin |
|---|---|---|
| `lg` | Open Lazy Git | Lazygit.nvim |
| `<C-k>` | Show information about the function (hover) | Nvim-lspconfig |
| `gd` | Go to definition | Nvim-lspconfig |
| `ca` | Code action | Nvim-lspconfig |
| `<C-f>` | Show files and folders on the left side | Neo-tree.nvim |
| `<C-b>` | Show Git status in a floating window | Neo-tree.nvim |
| `<C-p>` | Find files | Telescope.nvim |
| `<C-s>` | Search for a word in the code | Telescope.nvim |
| `<C-t>` | Open/Close terminal | Toggleterm.nvim |
| `<C-g>` | Open/Close Gemini terminal | Toggleterm.nvim |

## Basic Neovim Commands

---

### 📦 Normal Mode (`Esc`)

| Action | Command |
|--------|---------|
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

### ✏️ Insert Mode (`i`, `I`, `a`, `A`, `o`, `O`)

| Action | Command |
|--------|---------|
| Enter insert mode | `i` (before cursor), `a` (after cursor) |
| New line below / above | `o` / `O` |
| Exit insert mode | `Esc` |

### 🔍 Visual Mode (`v`, `V`, `Ctrl-v`)

| Action | Command |
|--------|---------|
| Enter visual mode | `v` (character), `V` (line), `Ctrl-v` (block) |
| Copy selection | `y` |
| Delete selection | `d` |
| Paste over selection | `p` |
| Indent / Unindent | `>` / `<` |
| Exit visual mode | `Esc` |

### 🧪 Command Mode (`:`)

| Action | Command |
|--------|---------|
| Run a command | `:` followed by command (e.g., `:w`, `:q`) |
| Open terminal | `:terminal` |
| Run shell command | `:!command` (e.g., `:!ls`) |

### 🪄 Useful Tips

- **Repeat last command**: `.`
- **Record macro**: `q<letter>` (e.g., `qa`), stop with `q`
- **Play macro**: `@<letter>` (e.g., `@a`)
- **Show line numbers**: `:set number`
- **Enable relative numbers**: `:set relativenumber`
- **Toggle paste mode**: `:set paste` / `:set nopaste`

