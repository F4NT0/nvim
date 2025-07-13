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
