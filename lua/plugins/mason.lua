-------------------------------------------
--  __  __                       
-- |  \/  | __ _ ___  ___  _ __  
-- | |\/| |/ _` / __|/ _ \| '_ \ 
-- | |  | | (_| \__ \ (_) | | | |
-- |_|  |_|\__,_|___/\___/|_| |_|
--------------------------------------------
--- GITHUB: https://github.com/williamboman/mason.nvim FOR MASON
--- GITHUB: https://github.com/williamboman/mason-lspconfig.nvim FOR MASON LSP CONFIGURATION
--- GITHUB: https://github.com/williamboman/
--- DESCRIPTION: This is the LSP manager to install language configurations

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
  
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "csharp_ls" }
        -- For C# need to install the tool: dotnet tool install --global csharp-ls
      })
    end
  },

  -----------------------------
  -- LSPCONFIG CONFIGURATION --
  -----------------------------
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- Lua Setup
      lspconfig.lua_ls.setup({})
      -- C# Setup
      lspconfig.csharp_ls.setup({})

      -- K shows the information about the function with the mouse inside
      vim.keymap.set('n', '<C-K>', vim.lsp.buf.hover, {})
      vim.keymap.set('n','gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, {})
    end
  }

}

