--[[ ============================================================================
PLUGIN: lukas-reineke/indent-blankline.nvim  (a.k.a. ibl)
============================================================================
Renders subtle vertical guides at every indentation level so it's easier to
see where a block starts and ends.

Repo: https://github.com/lukas-reineke/indent-blankline.nvim
Docs: Documentations/programming/indent-blankline.md
============================================================================ ]]

local theme = require("config.theme")

return {
  "lukas-reineke/indent-blankline.nvim",
  main  = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.api.nvim_set_hl(0, "IblIndent",   { fg = theme.border_muted })
    vim.api.nvim_set_hl(0, "IblScope",    { fg = theme.fg_muted })
    require("ibl").setup({
      indent  = { char = "│" },
      scope   = { enabled = true, show_start = false, show_end = false },
      exclude = { filetypes = { "dashboard", "lazy", "mason", "neo-tree", "help", "checkhealth" } },
    })
  end,
}
