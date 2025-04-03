---------------------------------------
--  _   _            _                 
-- | \ | | ___  ___ | |_ _ __ ___  ___ 
-- |  \| |/ _ \/ _ \| __| '__/ _ \/ _ \
-- | |\  |  __/ (_) | |_| | |  __/  __/
-- |_| \_|\___|\___/ \__|_|  \___|\___|
-----------------------------------------                                     
--- GITHUB: https://github.com/nvim-neo-tree/neo-tree.nvim
--- DESCRIPTION: Show all files and directories inside the current directory

return {
  
  ------------------
  -- INSTALLATION --
  ------------------
  
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },

  -------------------
  -- CONFIGURATION --
  -------------------

  config = function()

    -- Ctrl + F = Show files and folders on the left side of neovim
    vim.keymap.set('n', '<C-f>', ':Neotree filesystem reveal left<CR>', {})

    -- Ctrl + G = Show Git status into a float visualization
    vim.keymap.set('n', '<C-g>', ':Neotree float git_status<CR>', {})

  end
}
