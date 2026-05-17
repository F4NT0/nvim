--[[ ============================================================================
PLUGIN: nvimtools/none-ls.nvim  (fork of null-ls.nvim)
============================================================================
Injects results from external formatters and linters into Neovim's LSP
infrastructure so `vim.lsp.buf.format()` and diagnostics work uniformly.

Active sources:
  - stylua            Lua formatter
  - prettier          JS/TS/JSON/YAML/Markdown formatter
  - csharpier         C# formatter (.NET tool)

Repo: https://github.com/nvimtools/none-ls.nvim
Docs: Documentations/programming/none-ls.md
============================================================================ ]]

return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvimtools/none-ls-extras.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.csharpier,
      },
    })
  end,
}
