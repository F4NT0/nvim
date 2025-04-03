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
            icon = '',
            icon_hl = 'Title',
            desc = ' Find File',
            desc_hl = 'String',
            key = 'F',
            keymap = 'Ctrl + P',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Telescope find_files'
          },
          {
            icon = " ",
            key = 'B',
            desc = ' Search for code',
            keymap = 'Ctrl + S',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Telescope live_grep'
          },
        },
        footer = {}  --your footer
      },
    })
  end
}
