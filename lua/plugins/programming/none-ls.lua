--[[
  _   _                         _     
 | \ | |                       | |    
 |  \| | ___  _ __   ___ ______| |___ 
 | . ` |/ _ \| '_ \ / _ \______| / __|
 | |\  | (_) | | | |  __/      | \__ \
 |_| \_|\___/|_| |_|\___|      |_|___/
                                      
]]

--- GITHUB:
--- - none-ls.nvim: https://github.com/nvimtools/none-ls.nvim
--- - none-ls-extras.nvim: https://github.com/nvimtools/none-ls-extras.nvim

--- DESCRIPTION:
--- `none-ls.nvim` (formerly `null-ls`) is a Neovim plugin that allows you to hook external
--- tools (like linters and formatters) into the built-in LSP client using Lua.
--- It acts as a bridge between non-LSP tools and Neovim's LSP ecosystem.

--- DEPENDENCIES:
--- - `nvimtools/none-ls-extras.nvim`: A collection of community-maintained sources (like `eslint_d`).

--- USAGE:
--- This configuration sets up:
--- - `stylua` for formatting Lua files
--- - `eslint_d` for linting JavaScript/TypeScript
--- - `prettier` for formatting various file types (HTML, CSS, JS, etc.)

--- KEYMAPS:
--- This plugin does not define keymaps by default, but you can trigger formatting manually with:
--- ```lua
--- vim.keymap.set("n", "<leader>f", function()
---   vim.lsp.buf.format({ async = true })
--- end, { desc = "Format file with LSP/null-ls" })
--- ```

--- NOTES:
--- - `null-ls` was renamed to `none-ls`, but the Lua module name remains `null-ls` for compatibility.
--- - You can add more sources like `black`, `eslint`, `shellcheck`, etc.
--- - Use `:NullLsLog` to debug issues or check registered sources.

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    -- Get access to none-ls
    local null_ls = require("null-ls") -- The name is from the old project
    null_ls.setup({
      sources = {
        -- Formattings
        null_ls.builtins.formatting.stylua, -- Lua linter
        null_ls.builtins.formatting.prettier, -- To other languages
        -- Linters
        null_ls.builtins.diagnostics.checkstyle, -- Java
        null_ls.builtins.diagnostics.dotnet_diagnostic, -- C#
        null_ls.builtins.diagnostics.flake8, -- Python
        null_ls.builtins.diagnostics.revive, -- Go
      }
    })
  end
}
