--[[

PLUGIN NEOTREE

-> DESCRIÇÃO: Mostra todos os arquivos e pastas no diretório atual
-> PROJETO DO GITHUB: https://github.com/nvim-neo-tree/neo-tree.nvim 
-> COMANDOS DO TECLADO:
  - Ctrl + F = Abre o Neotree a esquerda
  - Enter = Abre o arquivo selecionado atual
  - S = Abre o arquivo selecionado na vertical
  - Shift + S = Abre o arquivo selecionado na horizontal
  - Backspace = Vai para o diretório anterior
  - Shift + P = Mostra/Fecha um preview do arquivo selecionado
  - A = Cria um novo arquivo ou diretório
  - D = Deleta o arquivo selecionado
  - R = Renomeia o arquivo selecionado
  - Y = Copia o arquivo selecionado
  - X = Corta o arquivo selecionado
  - C = Copia o arquivo ou diretório selecionado
  - M = Move o arquivo ou diretório selecionado
  - ? = Mosta um popup com os comandos disponiveis
  - Shift + Y = Copia o caminho até o arquivo no clipboard
  - Shift + O = Abre o arquivo selecionado fora do Neovim
-> COMANDOS DO NEOVIM:
  - :Neotree toggle = Abre/Fecha o plugin
  - :Neotree reveal = Abre o plugin no arquivo atual
  - :Neotree float = Abre o Neotree em uma aba flutuante
  - :Neotree show buffers right = Mostra a lista de buffers abertos
  - :Neotree float git_status = Abre uma aba flutuante com o status do git

--]]


----------------
-- INSTALAÇÃO --
---------------- 

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },

  -------------------
  -- CONFIGURAÇÃO --
  -------------------

  config = function()

    --- Meu tema de cores
    vim.cmd [[
      highlight NeoTreeDirectoryName guifg=#F5F8F6
      highlight NeoTreeDirectoryIcon guifg=#F9F8F8
      highlight NeoTreeFileName guifg=#FEFEFF
      highlight NeoTreeFileNameOpened guifg=#F19706 gui=bold
      highlight NeoTreeNormal guibg=#101329
      highlight NeotreeNormalNC guibg=#101329
      highlight NeoTreeEndOfBuffer guibg=#101329
      highlight NeoTreeFloatBorder guifg=#888A88
      highlight NeoTreeTabActive guibg=#101329 guifg=#F5F8F6
      highlight NeoTreeGitUntracked guifg=#25ED17 gui=bold
      highlight NeoTreeGitStaged guifg=#09BFFD
      highlight NeoTreeTitleBar guibg=#101329 guifg=#F5F8F6
      highlight NeoTreeRootName guifg=#F2A033

    ]]

    --- ícones dos status do GIT
    require("neo-tree").setup({
      default_component_configs = {
        git_status = {
          symbols = {
            added     = "",
            modified  = "",
            deleted   = "󰧧",
            renamed   = "󰑕",
            untracked = "★",
            ignored   = "◌",
            unstaged  = "✗",
            staged    = "✓",
            conflict  = "",
          }
        }
      },

      --- Organização da localização da aba
      window = {
        position = "left",
        popup = {
          size = {
            height = "90%",
            width = "70%",
          },
          position = "50%",
          border = {
            style = "rounded",
            text = {
              top = "",
            },
            highlight ="NeoTreeFloatBorder",
          },
        },
      },

      --- Mostrando todos os arquivos até mesmo os ocultos

    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      }
    },
})
  end
}
