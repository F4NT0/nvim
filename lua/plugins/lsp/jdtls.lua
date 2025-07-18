--[[
       _     _ _   _     
      | |   | | | | |    
      | | __| | |_| |___ 
  _   | |/ _` | __| / __|
 | |__| | (_| | |_| \__ \
  \____/ \__,_|\__|_|___/
                         
]]


--- GITHUB: https://github.com/mfussenegger/nvim-jdtls 
--- DESCRIPTION:  this plugin sets up Java language support and debugging in the neovim.
--- USAGE FILES: lua/config/jdtls.lua

return {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
    }
}

