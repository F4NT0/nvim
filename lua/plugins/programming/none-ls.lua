---------------------------------------------------
--  _   _  ____  _   _ ______      _       _____ 
-- | \ | |/ __ \| \ | |  ____|    | |     / ____|
-- |  \| | |  | |  \| | |__ ______| |    | (___  
-- | . ` | |  | | . ` |  __|______| |     \___ \ 
-- | |\  | |__| | |\  | |____     | |____ ____) |
-- |_| \_|\____/|_| \_|______|    |______|_____/ 
---------------------------------------------------                                              
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
        -- Setup lua formatter
        null_ls.builtins.formatting.stylua,
        -- Setup eslint linter for javascript
        require("none-ls.diagnostics.eslint_d"),
        -- Setup prettier to format languages, that are not lua
        null_ls.builtins.formatting.prettier
      }
    })
  end
}
