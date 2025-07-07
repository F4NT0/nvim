
# Plugin Commands and Shortcuts

This file lists the installed Neovim plugins, their commands, and configured shortcuts.

---

## 1. Catppuccin

- **GitHub URL:** [https://github.com/catppuccin/catppuccin](https://github.com/catppuccin/catppuccin)

### Commands

| Command | Description |
|---|---|
| `:colorscheme catppuccin` | Sets the colorscheme to Catppuccin. |

### Shortcuts

*No custom shortcuts configured in the file.*

---

## 2. Dashboard

- **GitHub URL:** [https://github.com/nvimdev/dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)

### Commands

| Command | Description |
|---|---|
| `Telescope find_files` | Find files using Telescope. |
| `Telescope live_grep` | Search for a word in the code using Telescope. |
| `Neotree filesystem float` | Show files and folders in a floating window. |
| `Neotree float git_status` | Show git status in a floating window. |
| `LazyGit` | Open LazyGit. |
| `ToggleTerm` | Open or close the terminal. |

### Dashboard Key Mappings

| Key | Description |
|---|---|
| `p` | Find files |
| `s` | Search for a word in the code |
| `f` | Show files and folders |
| `b` | Show git status |
| `l` | Open Lazy Git |
| `t` | Open/Close terminal |
| `g` | Open/Close Gemini terminal |

---

## 3. LazyGit

- **GitHub URL:** [https://github.com/kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

### Commands

| Command | Description |
|---|---|
| `:LazyGit` | Opens the LazyGit interface. |
| `:LazyGitConfig` | For LazyGit configuration. |
| `:LazyGitCurrentFile` | Runs LazyGit for the current file. |
| `:LazyGitFilter` | Opens LazyGit with a filter. |
| `:LazyGitFilterCurrentFile` | Opens LazyGit with a filter for the current file. |

### Shortcuts

| Shortcut | Command |
|---|---|
| `lg` | `<cmd>LazyGit<cr>` |

---

## 4. Lualine

- **GitHub URL:** [https://github.com/nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

*This plugin is for the status line and does not expose user commands in the configuration.*

---

## 5. Markview

- **GitHub URL:** [https://github.com/OXY2DEV/markview.nvim](https://github.com/OXY2DEV/markview.nvim)

### Commands

| Command | Description |
|---|---|
| `:Markview Toggle` | Toggles the markdown preview. |
| `:Markview split` | Opens the preview in a split window. |
| `:Markview hybrid` | Opens the preview in hybrid mode. |

### Shortcuts

*No custom shortcuts configured in the file.*

---

## 6. Mason, Mason LSP & LSPConfig

- **GitHub URLs:**
  - [https://github.com/williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
  - [https://github.com/williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
  - [https://github.com/neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

### Commands

| Command | Description |
|---|---|
| `:Mason` | Opens the Mason UI to manage LSPs. |

### Shortcuts

| Shortcut | Action |
|---|---|
| `<C-K>` | `vim.lsp.buf.hover` (Show function information) |
| `gd` | `vim.lsp.buf.definition` (Go to definition) |
| `ca` | `vim.lsp.buf.code_action` (Show code actions) |

---

## 7. Neo-tree

- **GitHub URL:** [https://github.com/nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)

### Commands

| Command | Description |
|---|---|
| `:Neotree toggle` | Open or close the file tree. |
| `:Neotree reveal` | Open the tree to the currently active file. |
| `:Neotree float` | Open Neo-tree in a floating window. |
| `:Neotree show buffers right` | Show the list of open buffers on the right side. |
| `:Neotree float git_status` | Open a floating window with the git status. |

### Shortcuts

| Shortcut | Command |
|---|---|
| `<C-f>` | `:Neotree filesystem float<CR>` |
| `<C-b>` | `:Neotree float git_status<CR>` |

### Neo-tree Window Key Mappings

| Key | Action |
|---|---|
| `<cr>` or `Enter` | Open the selected file. |
| `s` | Open in a vertical split. |
| `S` | Open in a horizontal split. |
| `<bs>` or `Backspace` | Go to parent directory. |
| `P` | Toggle preview. |
| `a` | Create a new file/directory. |
| `d` | Delete selected. |
| `r` | Rename selected. |
| `y` | Copy selected. |
| `x` | Cut selected. |
| `c` | Copy selected. |
| `m` | Move selected. |
| `?` | Show help. |
| `Y` | Copy path to clipboard. |
| `O` | Open with default system application. |

---

## 8. Noice

- **GitHub URL:** [https://github.com/folke/noice.nvim](https://github.com/folke/noice.nvim)

### Commands

| Command | Description |
|---|---|
| `:Noice` | Open the noice UI. |
| `:Noice last` | See the last message. |
| `:Noice history` | See the message history. |
| `:Noice dismiss` | Dismiss all messages. |

### Shortcuts

*No custom shortcuts configured in the file.*

---

## 9. Telescope

- **GitHub URL:** [https://github.com/nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

### Commands

| Command | Description |
|---|---|
| `:Telescope find_files` | Fuzzy find files. |
| `:Telescope live_grep` | Search for a string in the current directory. |

### Shortcuts

| Shortcut | Command |
|---|---|
| `<C-p>` | `find_files` |
| `<C-s>` | `live_grep` |

---

## 10. Toggleterm

- **GitHub URL:** [https://github.com/akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

### Commands

| Command | Description |
|---|---|
| `:ToggleTerm` | Toggles the terminal. |
| `:ToggleTerm direction=float` | Toggles a floating terminal. |
| `:ToggleTerm direction=vertical` | Toggles a vertical split terminal. |
| `:ToggleTerm direction=horizontal` | Toggles a horizontal split terminal. |
| `:TermExec cmd="..."` | Executes a command in a terminal. |

### Shortcuts

| Shortcut | Action |
|---|---|
| `<c-t>` | Open/Close terminal. |
| `<c-g>` | Toggle Gemini terminal. |

---

## 11. Treesitter

- **GitHub URL:** [https://github.com/nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### Commands

| Command | Description |
|---|---|
| `:TSUpdate` | Updates the language parsers. |

### Shortcuts

*No custom shortcuts configured in the file.*

---

## 12. Comment

- **GitHub URL:** https://github.com/numToStr/Comment.nvim

### Commands & Shortcuts (Normal Mode)

| Key/Command | Description |
|---|---|
| `gcc` | Toggle the current line comment. |
| `gbc` | Toggle the current block comment. |
| `[number]gcc` | Toggle comments for the specified number of lines. |
| `[number]gbc` | Toggle comments for the specified number of blocks. |
| `gco` | Insert a comment on the next line and enter INSERT mode. |
| `gcO` | Insert a comment on the previous line and enter INSERT mode. |
| `gcA` | Insert a comment at the end of the current line and enter INSERT mode. |

### Shortcuts

*No custom shortcuts configured in the file.*

