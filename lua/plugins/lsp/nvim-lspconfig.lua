--[[

PLUGIN LSPCONFIG

-> DESCRIÇÃO: Plugin oficial para configurar LSPs (servidores de linguagens para Neovim)
-> PROJETO NO GITHUB: https://github.com/neovim/nvim-lspconfig
-> OBSERVAÇÃO: Após adicionar o Mason, você deve configurar a linguagem aqui

--]]

return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- Ícones personalizados
    vim.fn.sign_define("DiagnosticSignError", { text = "✘", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "▲", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })


    -- LUA
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
    })
    -- C#
    vim.lsp.config("roslyn", {
      capabilities = capabilities,
    })
    -- YAML
    vim.lsp.config("yamlls", {
      capabilities = capabilities,
    })
  end,
}
