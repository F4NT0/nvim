--[[
   ____      _                              _       
  / ___|__ _| |_ _ __  _ __  _   _  ___ ___(_)_ __  
 | |   / _` | __| '_ \| '_ \| | | |/ __/ __| | '_ \ 
 | |__| (_| | |_| |_) | |_) | |_| | (_| (__| | | | |
  \____\__,_|\__| .__/| .__/ \__,_|\___\___|_|_| |_|
                |_|   |_|                           

]]

--- GITHUB: https://github.com/catppuccin/catppuccin
--- DESCRIPTION: Collection of themes for Neovim

return {

  -------------------
  --- INSTALLATION --
  -------------------

  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,

  --------------------
  --- CONFIGURATION --
  --------------------

  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      background = { dark = "mocha" },
      color_overrides = { mocha = { base = "#0d1117" } },
      no_italic = true,
      no_bold = true
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
