--[[ ============================================================================
PLUGIN: folke/noice.nvim
============================================================================
Modern replacement for the cmdline, messages and popup-menu UIs. Pairs with
nvim-notify for stylised toast notifications.

Repo: https://github.com/folke/noice.nvim
Docs: Documentations/interface/noice.md
============================================================================ ]]

local theme = require("config.theme")

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"]                 = true,
        ["cmp.entry.get_documentation"]                   = true,
      },
    },
    presets = {
      bottom_search   = true,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border  = true,
    },
    cmdline  = { view = "cmdline_popup" },
    messages = { view_search = false },
    routes   = {
      { filter = { event = "msg_show", kind = "", find = "written" }, opts = { skip = true } },
    },
  },
  config = function(_, opts)
    -- Light borders for noice popups so they match the rest of the editor.
    local hi = vim.api.nvim_set_hl
    hi(0, "NoiceCmdlinePopupBorder",       { fg = theme.border, bg = theme.bg_float })
    hi(0, "NoiceCmdlinePopupBorderSearch", { fg = theme.border, bg = theme.bg_float })
    hi(0, "NoicePopupmenuBorder",          { fg = theme.border, bg = theme.bg_float })
    hi(0, "NoiceConfirmBorder",            { fg = theme.border, bg = theme.bg_float })

    require("noice").setup(opts)
  end,
}
