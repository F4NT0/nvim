
# Neovim Cheatsheet

## Basic Neovim Commands

| Command | Description |
|---|---|
| `:w` | Save the current file. |
| `:q` | Quit Neovim. |
| `:q!` | Quit Neovim without saving changes. |
| `:wq` | Save the current file and quit. |
| `i` | Enter Insert mode at the current cursor position. |
| `a` | Enter Insert mode after the current cursor position. |
| `o` | Open a new line below the current line and enter Insert mode. |
| `O` | Open a new line above the current line and enter Insert mode. |
| `esc` | Exit Insert mode and return to Normal mode. |
| `dd` | Delete the current line. |
| `yy` | Yank (copy) the current line. |
| `p` | Paste the yanked content after the current line. |
| `P` | Paste the yanked content before the current line. |
| `u` | Undo the last change. |
| `<C-r>` | Redo the last undone change. |
| `/text` | Search for "text" in the file. |
| `n` | Move to the next occurrence of the search term. |
| `N` | Move to the previous occurrence of the search term. |
| `:%s/old/new/g` | Replace all occurrences of "old" with "new" in the file. |

## Plugin Commands

| Plugin | Command | Description |
|---|---|---|
| **Dashboard** | `Ctrl + P` | Find files using Telescope. |
| | `Ctrl + S` | Search for code in the current directory using Telescope. |
| **LazyGit** | `lg` | Open LazyGit in a floating window. |
| **Mason** | `<C-K>` | Show information about the function under the cursor. |
| | `gd` | Go to the definition of the symbol under the cursor. |
| | `ca` | Show available code actions for the current context. |
| **Neo-tree** | `<C-f>` | Toggle the file explorer on the left side. |
| | `<C-g>` | Show the Git status in a floating window. |
| **Telescope** | `<C-p>` | Find files in the current directory. |
| | `<C-s>` | Search for a string in the current directory. |
