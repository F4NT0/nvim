--[[
  __  __                       
 |  \/  |                      
 | \  / | __ _ ___  ___  _ __  
 | |\/| |/ _` / __|/ _ \| '_ \ 
 | |  | | (_| \__ \ (_) | | | |
 |_|  |_|\__,_|___/\___/|_| |_|
                               
]]

--- GITHUB: https://github.com/williamboman/mason.nvim FOR MASON
--- GITHUB: https://github.com/williamboman/mason-lspconfig.nvim FOR MASON LSP CONFIGURATION
--- GITHUB: https://github.com/williamboman/
--- DESCRIPTION: This is the LSP manager to install language configurations
--- WARNING: For C# need to install the tool: dotnet tool install --global csharp-ls

return {

  ------------------------- 
  -- MASON CONFIGURATION --
  -------------------------

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  ---------------------------------
  -- MASON LSPCONFIG CONFIGURATION
  ---------------------------------
  --- The next part of configuration is in nvim-lspconfig.lua
  --- Add the configurations from each language installed here

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "csharp_ls",
          "jdtls",
          "yamlls"
        },
        automatic_enable = true,
      })
    end
  }
}

