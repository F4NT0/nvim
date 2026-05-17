--[[ ============================================================================
PLUGIN: nvim-lualine/lualine.nvim
============================================================================
Bottom status line. Uses a custom theme derived from `config.theme` so the
colours match the editor background and borders.

Repo: https://github.com/nvim-lualine/lualine.nvim
Docs: Documentations/interface/lualine.md
============================================================================ ]]

local theme = require("config.theme")

return {
  "nvim-lualine/lualine.nvim",
  event        = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Build a lualine theme from the shared palette.
    local lualine_theme = {
      normal = {
        a = { fg = theme.bg,       bg = theme.blue,   gui = "bold" },
        b = { fg = theme.fg,       bg = theme.bg_alt },
        c = { fg = theme.fg_muted, bg = theme.bg },
      },
      insert   = { a = { fg = theme.bg, bg = theme.green,  gui = "bold" } },
      visual   = { a = { fg = theme.bg, bg = theme.purple, gui = "bold" } },
      replace  = { a = { fg = theme.bg, bg = theme.red,    gui = "bold" } },
      command  = { a = { fg = theme.bg, bg = theme.orange, gui = "bold" } },
      inactive = {
        a = { fg = theme.fg_muted, bg = theme.bg },
        b = { fg = theme.fg_muted, bg = theme.bg },
        c = { fg = theme.fg_muted, bg = theme.bg },
      },
    }

    require("lualine").setup({
      options = {
        theme              = lualine_theme,
        component_separators = { left = "│", right = "│" },
        section_separators   = { left = "", right = "" },
        globalstatus       = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", { "diff", symbols = { added = " ", modified = " ", removed = " " } } },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
          { "diagnostics", sources = { "nvim_diagnostic" }, symbols = { error = " ", warn = " ", info = " ", hint = " " } },
          "encoding", "fileformat", "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
