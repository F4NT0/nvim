--------------------------------------------------
--  _____                   _             _ 
-- |_   _|__ _ __ _ __ ___ (_)_ __   __ _| |
--   | |/ _ \ '__| '_ ` _ \| | '_ \ / _` | |
--   | |  __/ |  | | | | | | | | | | (_| | |
--   |_|\___|_|  |_| |_| |_|_|_| |_|\__,_|_|
--------------------------------------------------
---
--- GITHUB: https://github.com/akinsho/toggleterm.nvim
--- DESCRIPTION: A neovim plugin to persist and toggle terminals during development.
--- SHORTCUTS:
---   <c-t>: Open/Close terminal
---   <c-g>: Toggle gemini terminal
--- COMMANDS:
---   :ToggleTerm
---   :ToggleTerm direction=float
---   :ToggleTerm direction=vertical
---   :ToggleTerm direction=horizontal
---   :TermExec cmd="..."

return {
  
  "akinsho/toggleterm.nvim",
  version = "*",

  config = function()
    require("toggleterm").setup {
      open_mapping = [[<c-t>]],
      hide_numbers = true,
      direction = 'float',
      float_ops = {
        border = 'single',
      },
      shell = 'powershell.exe -NoLogo',
    }
      
    local Terminal = require("toggleterm.terminal").Terminal

    local gemini_term = Terminal:new({
          cmd = "gemini",
          direction = "float",
          float_ops = {
            border = "double",
          },
          hidden = true,
      })
      vim.keymap.set("n","<c-g>", function() gemini_term:toggle() end)
  end
}
