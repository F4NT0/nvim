--[[

PLUGIN DASHBOARD

-> DESCRIÇÃO: Este plugin quando chamamos o Neovim com o comando nvim abre uma tela inicial para usarmos.
-> PROJETO NO GITHUB: https://github.com/nvimdev/dashboard-nvim

--]]

return {

  ------------------
  -- INSTALAÇÃO --
  ------------------

  "nvimdev/dashboard-nvim",
  event = "VimEnter",

  -------------------
  -- CONFIGURAÇÃO --
  -------------------

  config = function()
    require("dashboard").setup ({
        theme = 'doom',
      config = {
        header = {
          "",
          "====================================================================",
          " ██╗      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗        ",
          " ╚██╗     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║        ",
          "  ╚██╗    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║        ",
          "  ██╔╝    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║        ",
          " ██╔╝     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║███████╗",
          " ╚═╝      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝╚══════╝",                                        "====================================================================",          
          ""
        },
        center = {
          {
            icon = '',
            icon_hl = 'Title',
            desc = ' Encontre um arquivo',
            desc_hl = 'String',
            key = 'Ctrl + Q',
            key_hl = 'Number',
            key_format = ' %s',
            action = 'Telescope find_files'
          },
          {
            icon = '󰈭',
            icon_hl = 'Title',
            desc = ' Busque uma palavra',
            desc_hl = 'String',
            key = 'Ctrl + S',
            key_hl = 'Number',
            key_format = ' %s',
            action = 'Telescope live_grep'
          },
          {
            icon = '',
            icon_hl = 'Title',
            desc = ' Ver todos os arquivos e pastas',
            desc_hl = 'String',
            key = 'Ctrl + F',
            key_hl = 'Number',
            key_format = ' %s',
            action = 'Neotree filesystem left'
          },
          {
            icon = '',
            icon_hl = 'Title',
            desc = ' Abre LazyGit',
            desc_hl = 'String',
            key = 'Ctrl + L',
            key_hl = 'Number',
            key_format = ' %s',
            action = 'LazyGit'
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = ' Mostre suas tasks',
            desc_hl = 'String',
            key = 'Space + T + D',
            key_hl = 'Number',
            key_format = ' %s',
            action = 'TodoTelescope'
          }
        },
        footer = {
          "",
          "  " .. os.date("%A, %d %B %Y | %H:%M:%S"),
          "",
          "",
          "Para ver todos os comandos disponiveis, use o comando `:Khelp`"
        }
      },
    })
  end
}
