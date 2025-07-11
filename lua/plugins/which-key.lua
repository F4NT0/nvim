------------------------------------------------------
--           _     _      _       _              
--          | |   (_)    | |     | |             
-- __      _| |__  _  ___| |__   | | _____ _   _ 
-- \ \ /\ / / '_ \| |/ __| '_ \  | |/ / _ \ | | |
--  \ V  V /| | | | | (__| | | | |   <  __/ |_| |
--   \_/\_/ |_| |_|_|\___|_| |_| |_|\_\___|\__, |
--                                          __/ |
--                                         |___/ 
------------------------------------------------------
-- GITHUB: https://github.com/folke/which-key.nvim
-- DESCRIPTION: Plugin to search for the keymaps available in this Neovim
-- COMMAND: Ctrl + ?


return {
 "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
     "<C-q>",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
