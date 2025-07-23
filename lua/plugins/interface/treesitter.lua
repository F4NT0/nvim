--[[

  _______                 _ _   _            
 |__   __|               (_) | | |           
    | |_ __ ___  ___  ___ _| |_| |_ ___ _ __ 
    | | '__/ _ \/ _ \/ __| | __| __/ _ \ '__|
    | | | |  __/  __/\__ \ | |_| ||  __/ |   
    |_|_|  \___|\___||___/_|\__|\__\___|_|   
                                             
]]

--- GITHUB: https://github.com/nvim-treesitter/nvim-treesitter
--- DESCRIPTION: Highlight and indent code for different languages
--- WARNING: This plugin need in Windows 11 the MSYS2 installed with gcc
--- LINK TO INSTALL MSYS2: https://www.msys2.org/
--- ATTENTION: Don't forget to add into the PATH in Environment Variables the location of msys2 and gcc

return {

  ------------------ 
  -- INSTALLATION --
  ------------------

  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",

  -------------------
  -- CONFIGURATION --
  -------------------

  config = function()
    local tree = require("nvim-treesitter.configs")
    tree.setup({
      ensure_installed = {
        "lua", 
        "c_sharp", 
        "java", 
        "powershell", 
        "toml", 
        "sql", 
        "json", 
        "yaml", 
        "xml",
        "latex", -- Install first the npm install -g tree-sitter-cli
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}

