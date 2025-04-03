------------------------------------------------
--  _____    _                                
-- |_   _|__| | ___  ___  ___ ___  _ __   ___ 
--   | |/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \
--   | |  __/ |  __/\__ \ (_| (_) | |_) |  __/
--   |_|\___|_|\___||___/\___\___/| .__/ \___|
--                                |_|         
--------------------------------------------------
--- GITHUB: https://github.com/nvim-telescope/telescope.nvim
--- DESCRIPTION: telescope.nvim is a highly extendable fuzzy finder over lists

return {

  ------------------
  -- INSTALLATION --
  ------------------

  "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" }, 
  
  -------------------
  -- CONFIGURATION --
  -------------------

  config = function()
    
    local builtin = require("telescope.builtin")

    -- Ctrl + P = Search for folder/files inside the current folder
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    
    -- Ctrl + S = Search into the code for a word
    vim.keymap.set('n', '<C-s>', builtin.find_files, {})

  end
}
