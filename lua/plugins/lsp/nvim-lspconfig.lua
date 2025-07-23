--[[
  _                            __ _       
 | |                          / _(_)      
 | |___ _ __   ___ ___  _ __ | |_ _  __ _ 
 | / __| '_ \ / __/ _ \| '_ \|  _| |/ _` |
 | \__ \ |_) | (_| (_) | | | | | | | (_| |
 |_|___/ .__/ \___\___/|_| |_|_| |_|\__, |
       | |                           __/ |
       |_|                          |___/ 

]]

--- GITHUB:  https://github.com/neovim/nvim-lspconfig
--- DESCRIPTION: Official plugin to configure and manage Language Server Protocol (LSP) clients in Neovim.
--- USAGE: Set up the desired language server
--- OBSERVATION: after added into mason the language server you need to configure here the language.

return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Lua Setup
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })
    -- C# Setup
    lspconfig.omnisharp.setup({
      capabilities = capabilities,
      enable_import_completion = true,
      organize_imports_on_format = true,
      enable_roslyn_analyzers = true,
    })
    -- Java Setup
    lspconfig.jdtls.setup({
      capabilities = capabilities,
    })
    -- Yaml Setup
    lspconfig.yamlls.setup({
      capabilities = capabilities,
    })
    -- Go Setup
    lspconfig.gopls.setup({
      capabilities = capabilities,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        }
      }
    })
  end,
}
