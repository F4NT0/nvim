--[[ ============================================================================
PLUGIN: seblyng/roslyn.nvim  (C# LSP)
============================================================================
Drives Microsoft's official Roslyn language server, which replaced OmniSharp
as the recommended C# LSP. Inlay hints, semantic tokens, code lens and Razor
features are all enabled.

Prerequisites (validated by the Go installer):
  - .NET SDK 8 or newer on PATH
  - `roslyn` installed via Mason (`:MasonInstall roslyn rzls`)

Repo: https://github.com/seblyng/roslyn.nvim
Docs: Documentations/programming/roslyn.md
============================================================================ ]]

return {
  "seblyng/roslyn.nvim",
  ft = { "cs", "razor", "cshtml" },
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    if ok_cmp then
      capabilities = cmp_lsp.default_capabilities(capabilities)
    end

    vim.lsp.config("roslyn", {
      capabilities = capabilities,
      on_attach    = function(_, _) vim.notify("Roslyn LSP attached", vim.log.levels.INFO) end,
      settings = {
        ["csharp|inlay_hints"] = {
          csharp_enable_inlay_hints_for_implicit_object_creation                  = true,
          csharp_enable_inlay_hints_for_implicit_variable_types                   = true,
          csharp_enable_inlay_hints_for_lambda_parameter_types                    = true,
          csharp_enable_inlay_hints_for_types                                     = true,
          dotnet_enable_inlay_hints_for_indexer_parameters                        = true,
          dotnet_enable_inlay_hints_for_literal_parameters                        = true,
          dotnet_enable_inlay_hints_for_object_creation_parameters                = true,
          dotnet_enable_inlay_hints_for_other_parameters                          = true,
          dotnet_enable_inlay_hints_for_parameters                                = true,
          dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix   = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name     = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent     = true,
        },
        ["csharp|code_lens"] = {
          dotnet_enable_references_code_lens = true,
          dotnet_enable_tests_code_lens      = true,
        },
        ["csharp|background_analysis"] = {
          dotnet_analyzer_diagnostics_scope = "fullSolution",
          dotnet_compiler_diagnostics_scope = "fullSolution",
        },
      },
    })

    require("roslyn").setup({
      filewatching = "auto",
      broad_search = false,
      lock_target  = false,
    })
  end,
}
