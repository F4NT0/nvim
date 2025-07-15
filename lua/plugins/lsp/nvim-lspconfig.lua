------------------------------------------------------------------
--  _       _____ _____   _____ ____  _   _ ______ _____ _____
-- | |     / ____|  __ \ / ____/ __ \| \ | |  ____|_   _/ ____|
-- | |    | (___ | |__) | |   | |  | |  \| | |__    | || |  __
-- | |     \___ \|  ___/| |   | |  | | . ` |  __|   | || | |_ |
-- | |____ ____) | |    | |___| |__| | |\  | |     _| || |__| |
-- |______|_____/|_|     \_____\____/|_| \_|_|    |_____\_____|
--
------------------------------------------------------------------
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
    lspconfig.csharp_ls.setup({
      capabilities = capabilities,
    })
    -- Java Setup
    lspconfig.jdtls.setup({
      capabilities = capabilities,
    })
    -- Yaml Setup
    lspconfig.yamlls.setup({
      capabilities = capabilities,
    })
  end,
}
