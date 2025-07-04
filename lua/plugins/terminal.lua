return {
  
  "akinsho/toggleterm.nvim",
  version = "*",

  -----------------------------
  -- BASIC TERMINAL FLOATING
  -----------------------------

  config = function()
    require("toggleterm").setup {
      open_mapping = [[<c-t>]], -- Open/Close terminal
      hide_numbers = true,
      direction = 'float',
      float_ops = {
        border = 'single',
      },
      shell = 'powershell.exe', -- Windows Shell
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
