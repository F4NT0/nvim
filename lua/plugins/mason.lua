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
        ensure_installed = {
          "lua_ls",
          "csharp_ls", -- For C# need to install the tool: dotnet tool install --global csharp-ls
          "jdtls"
        },
        automatic_enable = true,
      })
    end
  },

  --------------------------------------------
  -- JAVA JDTLS LANGUAGE SERVER CONFIGURATION
  --------------------------------------------
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
    }
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
      -- Java Setup
      lspconfig.jdtls.setup({})

      -- Shortcuts to use the LSP configurations into the code, when there's an message use it 
      vim.keymap.set('n', 'ch', vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
      vim.keymap.set('n','cd', vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
      vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
      vim.keymap.set('n', 'cr', require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
      vim.keymap.set('n', 'ci', require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
      vim.keymap.set('n', 'cR', vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
      vim.keymap.set('n', 'cD', vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
    end
  }

}

