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

      -- Shortcuts to use the LSP configurations into the code, when there's an message use it 
      vim.keymap.set('n', 'ch', vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
      vim.keymap.set('n','cd', vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
      vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
      vim.keymap.set('n', 'cr', require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
      vim.keymap.set('n', 'ci', require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
      vim.keymap.set('n', 'cR', vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
      vim.keymap.set('n', 'cD', vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
      vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, { desc = "[S]how [D]iagnostics" })
    end
}

