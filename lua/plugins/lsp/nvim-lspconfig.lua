--[[

PLUGIN LSPCONFIG

-> DESCRIÇÃO: Plugin oficial para configurar LSPs (servidores de linguagens para Neovim)
-> PROJETO NO GITHUB: https://github.com/neovim/nvim-lspconfig
-> OBSERVAÇÃO: Após adicionar o Mason, você deve configurar a linguagem aqui

--]]

return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- LUA
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })
    -- C#
    lspconfig.omnisharp.setup({
      capabilities = capabilities,
      enable_import_completion = true,
      organize_imports_on_format = true,
      enable_roslyn_analyzers = true,
    })
    -- YAML
    lspconfig.yamlls.setup({
      capabilities = capabilities,
    })
  end,
}
