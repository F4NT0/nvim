--[[ ============================================================================
PLUGIN: rachartier/tiny-inline-diagnostic.nvim
============================================================================
Renders LSP diagnostics inline next to the offending code, with a compact
arrow pointing to the symbol. Replaces the default `virtual_text` rendering.

Repo: https://github.com/rachartier/tiny-inline-diagnostic.nvim
Docs: Documentations/interface/tiny-inline-diagnostic.md
============================================================================ ]]

return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event    = "LspAttach",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      preset    = "modern",
      transparent_bg = false,
      hi = { mixing_color = "None" },
      options = {
        show_source            = true,
        throttle               = 20,
        softwrap               = 30,
        multiple_diag_under_cursor = true,
        multilines = { enabled = true, always_show = false },
      },
    })
    -- Disable the default virtual text so we don't render diagnostics twice.
    vim.diagnostic.config({ virtual_text = false })
  end,
}
