--[[
            _            _              
           | |          (_)             
   ___ ___ | | ___  _ __ _ _______ _ __ 
  / __/ _ \| |/ _ \| '__| |_  / _ \ '__|
 | (_| (_) | | (_) | |  | |/ /  __/ |   
  \___\___/|_|\___/|_|  |_/___\___|_|   

]]


--- GITHUB: https://github.com/NvChad/nvim-colorizer
--- DESCRIPTION: Show the colors of the hexadecimals in the file

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
