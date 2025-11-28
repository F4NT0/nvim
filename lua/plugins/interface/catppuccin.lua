--[[

PLUGIN CATPPUCCIN 

-> DESCRIÇÃO: Este plugin é o tema do nosso Neovim.
-> PROJETO NO GITHUB: https://github.com/catppuccin/catppuccin 
-> COR DE FUNDO PERSONALIZADA: #101329

--]]

return {

  -------------------
  --- INSTALAÇÃO --
  -------------------

  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,

  --------------------
  --- CONFIGURAÇÃO --
  --------------------

  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      background = { dark = "mocha" },
      color_overrides = { mocha = { base = "#101329" } },
      no_italic = true,
      no_bold = true
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
