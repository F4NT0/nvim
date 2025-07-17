--
--
--
-- GITHUB: https://github.com/NvChad/nvim-colorizer

return {
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" }, -- Active to all files 
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = true,
          css = true,
          css_fn = true,
          mode = "background", -- you can use as foreground
        },
      })
    end,
  }
}
