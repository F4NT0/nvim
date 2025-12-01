--[[

PLUGIN NONE-LS

-> DESCRIÇÃO: Plugin que gerencia linters e formatters de fora do Neovim.
  - Antigamente se chamava null-ls.
  - Linter mostra se tem erros no código.
  - Formatters ajusta o código para a linguagem específica
-> PROJETOS NO GITHUB:
  - https://github.com/nvimtools/none-ls.nvim
  - https://github.com/nvimtools/none-ls-extras.nvim
-> COMANDOS DO NEOVIM:
  - Rode o comando :NullLsLog para ver o que precisa ajustar no código

--]]


--- - Use `:NullLsLog` to debug issues or check registered sources.

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Formattings
        null_ls.builtins.formatting.stylua, -- Lua linter
        null_ls.builtins.formatting.prettier, -- To other languages
        -- Linters
        -- null_ls.builtins.diagnostics.dotnet_diagnostic, -- C#
      }
    })
  end
}
