# Keymap manual

`<leader>` is mapped to **Space**. This file is also rendered in-editor by the
`:Khelp` command.

## Windows / screens

| Shortcut    | Action                                       | Plugin            |
| ----------- | -------------------------------------------- | ----------------- |
| `Ctrl + L`  | Open LazyGit in a floating window            | lazygit.nvim      |
| `Ctrl + F`  | Open the file explorer (left side)           | neo-tree.nvim     |
| `Ctrl + X`  | Close the file explorer                      | neo-tree.nvim     |
| `Ctrl + Q`  | Fuzzy-find files in the project              | telescope.nvim    |
| `Ctrl + S`  | Live grep (search content across files)      | telescope.nvim    |
| `Ctrl + T`  | Toggle the floating terminal                 | toggleterm.nvim   |
| `:Khelp`    | Open this manual inside a floating window    | nui.nvim          |

## Terminal

| Shortcut          | Action                                        |
| ----------------- | --------------------------------------------- |
| `Ctrl + T`        | Toggle the default floating terminal          |
| `Space + C + T`   | Close the default terminal                    |
| `Space + D`       | `dotnet run` on the current C# file/project   |
| `Space + X`       | Close the .NET terminal                       |

## Buffer tabs (barbar)

| Shortcut    | Action                              |
| ----------- | ----------------------------------- |
| `Alt + ,`   | Previous tab                        |
| `Alt + .`   | Next tab                            |
| `Alt + <`   | Move current tab one slot left      |
| `Alt + >`   | Move current tab one slot right     |
| `Alt + 1…6` | Jump to tab 1 to 6                  |
| `Alt + P`   | Pin current tab                     |
| `Alt + C`   | Close current tab                   |

## Surround (nvim-surround)

| Before          | Command       | After             |
| --------------- | ------------- | ----------------- |
| `word`          | `ysiw)`       | `(word)`          |
| `some text`     | `ys$"`        | `"some text"`     |
| `[delete]`      | `ds]`         | `delete`          |
| `<b>HTML</b>`   | `dst`         | `HTML`            |
| `'word'`        | `cs'"`        | `"word"`          |
| `<b>HTML</b>`   | `csth1<CR>`   | `<h1>HTML</h1>`   |
| `call(arg)`     | `dsf`         | `arg`             |

## Comments (Comment.nvim)

| Shortcut            | Action                                          |
| ------------------- | ----------------------------------------------- |
| `gcc`               | Toggle comment on current line                  |
| `gbc`               | Toggle comment on current block                 |
| `gco` / `gcO`       | Insert comment on the line below / above        |
| `gcA`               | Insert comment at the end of the current line   |
| `<n> gcc`           | Toggle comments on the next `n` lines           |

## Completion (nvim-cmp)

| Shortcut       | Action                              |
| -------------- | ----------------------------------- |
| `Ctrl + K`     | Select previous suggestion          |
| `Ctrl + J`     | Select next suggestion              |
| `Ctrl + B`     | Scroll documentation up             |
| `Ctrl + F`     | Scroll documentation down           |
| `Ctrl + Space` | Trigger completion                  |
| `Ctrl + E`     | Abort completion                    |
| `Enter`        | Confirm the highlighted suggestion  |

## TODO comments

| Shortcut          | Action                                       |
| ----------------- | -------------------------------------------- |
| `Space + T + D`   | List every `TODO/FIX/HACK/WARN/PERF/NOTE`    |
| `:TodoQuickFix`   | Same list in the quickfix window             |

## Git (gitsigns)

| Shortcut             | Action                                  |
| -------------------- | --------------------------------------- |
| `Space + H + S`      | Stage the current hunk                  |
| `Space + H + R`      | Reset (undo) the current hunk           |
| `Space + H + Shift+S`| Stage every hunk in the buffer          |
| `Space + H + Shift+R`| Reset every hunk in the buffer          |
| `Space + H + P`      | Preview hunk under the cursor           |
| `Space + H + B`      | Toggle line-blame                       |
| `]c` / `[c`          | Jump to next / previous hunk            |

## LSP / Code

| Shortcut             | Action                                       |
| -------------------- | -------------------------------------------- |
| `Space + C + H`      | Hover documentation                          |
| `Space + C + D`      | Go to definition                             |
| `Space + C + A`      | Code actions                                 |
| `Space + C + R`      | Go to references                             |
| `Space + C + I`      | Go to implementations                        |
| `Space + C + Shift+R`| Rename symbol                                |
| `Space + C + Shift+D`| Go to declaration                            |
| `Space + S + D`      | Show diagnostic under the cursor             |
| `Space + C + F`      | Format the current buffer                    |
| `Space + D + L`      | Send all diagnostics to the location list    |

## Debug (nvim-dap)

| Shortcut          | Action                       |
| ----------------- | ---------------------------- |
| `Space + D + T`   | Toggle breakpoint            |
| `Space + D + S`   | Start / continue session     |
| `Space + D + C`   | Close the dap-ui panels      |
| `Space + D + O`   | Step over                    |
| `Space + D + I`   | Step into                    |
| `Space + D + U`   | Step out                     |

## .NET (easy-dotnet)

| Shortcut          | Action                       |
| ----------------- | ---------------------------- |
| `Space + N + D`   | `dotnet run`                 |
| `Space + N + T`   | `dotnet test`                |
| `Space + N + B`   | `dotnet build`               |
| `Space + N + R`   | `dotnet restore`             |
| `Space + N + S`   | User secrets manager         |

## Tests (neotest)

| Shortcut          | Action                                   |
| ----------------- | ---------------------------------------- |
| `Space + T + N`   | Run nearest test                         |
| `Space + T + F`   | Run all tests in the current file        |
| `Space + T + A`   | Run every test in the project            |
| `Space + T + S`   | Toggle the test summary panel            |
| `Space + T + O`   | Open the last test output                |

## Basic Neovim commands

### Normal mode

| Action                       | Command                                  |
| ---------------------------- | ---------------------------------------- |
| Move cursor                  | `h` / `j` / `k` / `l`                    |
| Save                         | `:w`                                     |
| Quit                         | `:q`                                     |
| Save and quit                | `:wq` or `ZZ`                            |
| Discard changes and quit     | `:q!`                                    |
| Open file                    | `:e filename`                            |
| Horizontal / vertical split  | `:split` / `:vsplit`                     |
| Move between splits          | `Ctrl + w` then `h/j/k/l`                |
| Search                       | `/pattern`                               |
| Replace                      | `:%s/old/new/g`                          |
| Undo / Redo                  | `u` / `Ctrl + r`                         |
| Copy / paste / delete line   | `yy` / `p` / `dd`                        |

### Insert / Visual / Command

| Action                       | Command                                  |
| ---------------------------- | ---------------------------------------- |
| Enter insert mode            | `i` (before cursor), `a` (after cursor)  |
| New line below / above       | `o` / `O`                                |
| Visual char / line / block   | `v` / `V` / `Ctrl + v`                   |
| Run command                  | `:<command>`                             |
| Run shell command            | `:!<command>`                            |
| Open terminal                | `:terminal`                              |

### Tips

- **Repeat last command**: `.`
- **Record / play macro**: `q<letter>` … `q` to stop, `@<letter>` to play.
- **Toggle paste**: `:set paste` / `:set nopaste`
