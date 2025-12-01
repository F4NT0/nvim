# Manual de comandos do Neovim

## Atalhos do Teclado

### Telas disponíveis

| Comando | Ação | Plugin |
|---|---|---|
| `Ctrl + L` | Abre o LazyGit | Lazygit.nvim |
| `Ctrl + F` | Abre o gerenciador de arquivos a esquerda | Neo-tree.nvim |
| `Ctrl + X` | Fecha o gerenciador de arquivos quando inativo | Neo-tree.nvim |
| `Ctrl + Q` | Abre uma tela de busca de arquivos  | Telescope.nvim |
| `Ctrl + S` | Abre uma tela de busca por palavras | Telescope.nvim |
| `Ctrl + T` | Abre um terminal em uma janela flutuante| Toggleterm.nvim |

### Controle das abas

| Comando | Ação | Plugin |
|---|---|---|
| `Alt + ,` | Volta para a aba anterior        | barbar.nvim |
| `Alt + .` | Vai para a próxima aba           | barbar.nvim |
| `Alt + <` | Reordena as abas para a esquerda | barbar.nvim |
| `Alt + >` | Reordena as abas para a direita  | barbar.nvim |
| `Alt + 1` | Move para a aba 1                | barbar.nvim |
| `Alt + 2` | Move para a aba 2                | barbar.nvim |
| `Alt + 3` | Move para a aba 3                | barbar.nvim |
| `Alt + 4` | Move para a aba 4                | barbar.nvim |
| `Alt + 5` | Move para a aba 5                | barbar.nvim |
| `Alt + 6` | Move para a aba 6                | barbar.nvim |
| `Alt + P` | Marque a aba atual               | barbar.nvim |
| `Alt + C` | Fecha a aba atual                | barbar.nvim |

### Para auxiliar adicionar simbolos em palavras

| Comando | Ação | Plugin
|---|---|---|
| `Y + S + I + W + )` | Coloca parentes entre a palavra   | nvim-surround |
| `Y + S + $ + "` | Coloca no final do cursor aspas dupla | nvim-surround |
| `D + S + ]` | Deleta os [] de uma palavra               | nvim-surround |
| `D + S + T` | Deleta a tag html em volta de uma palavra              | nvim-surround |
| `C + S + ' + "` | Troca aspas simples por aspas duplas de uma palavra | nvim-surround |
| `C + S + T + H + 1 + Enter` | Altera a tag de html para h1 | nvim-surround |
| `D + S + F` | Deleta a chamada de uma função | nvim-surround |


### Para comentar linhas de código

| Comando | Ação | Plugin
|---|---|---|
| `G + C + C` | Comenta/Descomenta linha atual | Comment.nvim |
| `G + B + C` | Comenta/Descomenta bloco de código | Comment.nvim |
| `G + C + O` | Insere um comentário na próxima linha | Comment.nvim |
| `G + C + Shift + O` | Insere um comentário na linha anterior | Comment.nvim |
| `G + C + Shift + A` | Insere um comentátio no fim da linha atual | Comment.nvim |
| `Ctrl + K` | Sugestão anterior | nvim-cmp |
| `Ctrl + J` | Próxima sugestão | nvim-cmp |
| `Ctrl + B` | Scroll docs below | nvim-cmp |
| `Ctrl + Space` | Show completion suggestions | nvim-cmp |
| `Ctrl + F` | Scroll docs above | nvim-cmp |
| `Ctrl + E` | Close completion window | nvim-cmp |
| `Enter` | Confirm Selection | nvim-cmp |

### Gerenciar tarefas para se fazer no código

| Comando | Ação | Plugin
|---|---|---|
| `Space + T + D` | Abre a tela onde mostra todas as tarefas do projeto | todo-comments.nvim

### Lidando com modificações no código

| Comando | Ação | Plugin
|---|---|---|
|`Space + H + S`| Adiciona/Remove as modificações do arquivo | gitsigns.nvim
|`Space + H + R`| Desfaz as modificações salvas | gitsigns.nvim
|`Space + H + Shift + S` | Salve todas as modificações do arquivo | gitsigns.nvim
|`Space + H + Shift + R` | Desfaz todas as modificações salvas | gitsigns.nvim
|`Space + H + P` | Verifique o que tem salvo | gitsigns.nvim

### Comandos para gerenciar código (TBD)

| Comando | Ação | Plugin |
|---|---|---|
| `Space + D + T` | Coloque um breakpoint na linha atual | nvim-dap |
| `Space + D + S` | Iniciar Debug | nvim-dap |
| `Space + D + C` | Finalizar Debug | nvim-dap |
| `Space + C + H` | Verificar documentação do código | nvim-lspconfig |
| `Space + C + D` | Vai até a definição do código | nvim-lspconfig |
| `Space + C + A` | Code Actions to fix the issue | nvim-lspconfig |
| `Space + C + R` | Code Go to References | nvim-lspconfig |
| `Space + C + I` | Code Go to Implementations | nvim-lspconfig |
| `Space + C + Shift + R` | Code Rename | nvim-lspconfig |
| `Space + C + Shift + D` | Code Go to Declaration | nvim-lspconfig |
| `Space + S + D` | Show Diagnostic of the Warning or Error | nvim-lspconfig |
| `Space + C + F` | Format the code into the specific language | nvim-lspconfig |

## Basic Neovim Commands

### Normal Mode (`Esc`)

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

### Insert Mode (`i`, `I`, `a`, `A`, `o`, `O`)

| Action | Command |
|---|---|
| Enter insert mode | `i` (before cursor), `a` (after cursor) |
| New line below / above | `o` / `O` |
| Exit insert mode | `Esc` |

### Visual Mode (`v`, `V`, `Ctrl-v`)

| Action | Command |
|---|---|
| Enter visual mode | `v` (character), `V` (line), `Ctrl-v` (block) |
| Copy selection | `y` |
| Delete selection | `d` |
| Paste over selection | `p` |
| Indent / Unindent | `>` / `<` |
| Exit visual mode | `Esc` |

### Command Mode (`:`)

| Action | Command |
|---|---|
| Run a command | `:` followed by command (e.g., `:w`, `:q`) |
| Open terminal | `:terminal` |
| Run shell command | `:!command` (e.g., `:!ls`) |

## Useful Tips

- **Repeat last command**: `.`
- **Record macro**: `q<letter>` (e.g., `qa`), stop with `q`
- **Play macro**: `@<letter>` (e.g., `@a`)
- **Show line numbers**: `:set number`
- **Enable relative numbers**: `:set relativenumber`
- **Toggle paste mode**: `:set paste` / `:set nopaste`
