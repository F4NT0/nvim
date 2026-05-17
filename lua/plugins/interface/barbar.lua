--[[ ============================================================================
PLUGIN: romgrk/barbar.nvim
============================================================================
Tabline plugin: each open buffer becomes a tab at the top of the editor.
Keymaps live in `lua/config/keymaps.lua`.

Repo: https://github.com/romgrk/barbar.nvim
Docs: Documentations/interface/barbar.md
============================================================================ ]]

return {
  "romgrk/barbar.nvim",
  event = "VeryLazy",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    animation       = true,
    auto_hide       = false,
    tabpages        = true,
    clickable       = true,
    icons = {
      buffer_index    = false,
      buffer_number   = false,
      button          = "",
      diagnostics     = { [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "✘" } },
      gitsigns        = { added = { enabled = true, icon = "+" }, changed = { enabled = true, icon = "~" }, deleted = { enabled = true, icon = "-" } },
      filetype        = { enabled = true },
      separator       = { left = "▎", right = "" },
      modified        = { button = "●" },
      pinned          = { button = "車", filename = true },
      preset          = "default",
    },
    insert_at_end   = false,
    insert_at_start = false,
    maximum_padding = 1,
    minimum_padding = 1,
    maximum_length  = 30,
    sidebar_filetypes = {
      ["neo-tree"] = { event = "BufWipeout" },
    },
  },
  version = "^1.0.0",
}
