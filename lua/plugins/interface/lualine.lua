--[[

PLUGIN LUALINE

-> DESCRIÇÃO: Mostra uma barra de status embaixo do Neovim.
-> PROJETO NO GITHUB: https://github.com/nvim-lualine/lualine.nvim
-> TEMAS: https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md 

--]]

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
