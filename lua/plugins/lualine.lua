----------------------------------------
-- LUA LINE CONFIGURATION FOR NEOVIM --
----------------------------------------
-- GITHUB: https://github.com/nvim-lualine/lualine.nvim
-- THEMES: https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md

return {
  -- Installation
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  -- Configuration
  config = function()
    require("lualine").setup({
      options = {
        theme = "iceberg_dark"     
      }
    })
  end
}
