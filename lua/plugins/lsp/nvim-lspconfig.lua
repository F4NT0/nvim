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

      
    end
}

