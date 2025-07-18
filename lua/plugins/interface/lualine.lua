--[[
  _                _ _            
 | |   _   _  __ _| (_)_ __   ___ 
 | |  | | | |/ _` | | | '_ \ / _ \
 | |__| |_| | (_| | | | | | |  __/
 |_____\__,_|\__,_|_|_|_| |_|\___|

]]

--- GITHUB: https://github.com/nvim-lualine/lualine.nvim
--- THEMES: https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
--- DESCRIPTION: Status bar to style neovim task bar

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("lualine").setup({
      options = {
        theme = "iceberg_dark"
      }
    })
  end
}
