return {
  -- Instalation and dependencies
  "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" }, 
  
  -- Configuration
  config = function()
    
    local builtin = require("telescope.builtin")

    -- Ctrl + P = Search for folder/files inside the current folder
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    
    -- Ctrl + S = Search into the code for a word
    vim.keymap.set('n', '<C-s>', builtin.find_files, {})

  end
}
