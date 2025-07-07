----------------------------------------------------------
--  ____            _     _                         _ 
-- |  _ \  __ _ ___| |__ | |__   ___   __ _ _ __ __| |
-- | | | |/ _` / __| '_ \| '_ \ / _ \ / _` | '__/ _` |
-- | |_| | (_| \__ \ | | | |_) | (_) | (_| | | | (_| |
-- |____/ \__,_|___/_| |_|_.__/ \___/ \__,_|_|  \__,_|
-----------------------------------------------------------                                                   
--- GITHUB: https://github.com/nvimdev/dashboard-nvim
--- DESCRIPTION: This is a simple dashboad when start nvim without a specific file

return {

  ------------------
  -- INSTALLATION --
  ------------------

  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  
  -------------------
  -- CONFIGURATION --
  -------------------

  config = function()
    require("dashboard").setup ({
        theme = 'doom',
      config = {
        header = {
          "",  
          "███████╗ █████╗ ███╗   ██╗████████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "██╔════╝██╔══██╗████╗  ██║╚══██╔══╝██╔═══██╗██║   ██║██║████╗ ████║",
          "█████╗  ███████║██╔██╗ ██║   ██║   ██║   ██║██║   ██║██║██╔████╔██║",
          "██╔══╝  ██╔══██║██║╚██╗██║   ██║   ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║     ██║  ██║██║ ╚████║   ██║   ╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          ""                                                                 
        },
        center = {
          {
            icon = '',
            icon_hl = 'Title',
            desc = ' Find files',
            desc_hl = 'String',
            key = 'p',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Telescope find_files'
          },
          {
            icon = '󰈭',
            icon_hl = 'Title',
            desc = ' Search for a word in the code',
            desc_hl = 'String',
            key = 's',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Telescope live_grep'
          },
          {
            icon = '',
            icon_hl = 'Title',
            desc = ' Show files and folders',
            desc_hl = 'String',
            key = 'f',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Neotree filesystem float'
          },
          {
            icon = '',
            icon_hl = 'Title',
            desc = ' Show git status',
            desc_hl = 'String',
            key = 'b',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Neotree float git_status'
          },
          {
            icon = '',
            icon_hl = 'Title',
            desc = ' Open Lazy Git',
            desc_hl = 'String',
            key = 'l',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'LazyGit'
          },
          {
            icon = '',
            icon_hl = 'Title',
            desc = ' Open/Close terminal',
            desc_hl = 'String',
            key = 't',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'ToggleTerm'
          },
          {
            icon = '',
            icon_hl = 'Title',
            desc = ' Open/Close Gemini terminal',
            desc_hl = 'String',
            key = 'g',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua require("toggleterm.terminal").Terminal:new({ cmd = "gemini", direction = "float", float_ops = { border = "double" }, hidden = true }):toggle()'
          },
        },
        footer = {}  --your footer
      },
    })
  end
}
