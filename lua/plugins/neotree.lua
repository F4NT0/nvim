return {
  -- Instalation
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },

  -- Configuration
  config = function()

    -- Ctrl + F = Show files and folders on the left side of neovim
    vim.keymap.set('n', '<C-f>', ':Neotree filesystem reveal left<CR>', {})

    -- Ctrl + G = Show Git status into a float visualization
    vim.keymap.set('n', '<C-g>', ':Neotree float git_status<CR>', {})

  end
}
