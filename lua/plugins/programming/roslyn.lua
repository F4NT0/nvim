--[[

PLUGIN ROSLYN

-> DESCRIÇÃO: Esse Plugin é para programar em C#
-> PROJETO NO GITHUB: https://github.com/seblyng/roslyn.nvim
-> ATENÇÃO:
  - Adicione no arquivo de Plugin do Mason no ensure_installed o nome "roslyn" e "rzln"
  - Adicione no lsp-config a seguinte linha: vim.lsp.config("roslyn", {})
  - Deve ser instalado o roslyn no Plugin Mason (:MasonInstall roslyn)
  - Deve ser instalado localmente no seu computador o roslyn: 

--]]

return {
  "seblyng/roslyn.nvim",
  config = function()
    vim.lsp.config("roslyn", {
      on_attach = function()
          print("Servidor Roslyn iniciado!")
      end,
      settings = {
        ["csharp|inlay_hints"] = {
          csharp_enable_inlay_hints_for_implicit_object_creation = true,
          csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|code_lens"] = {
          dotnet_enable_references_code_lens = true,
        },
      },
    })
    require("roslyn").setup()
  end,
}
