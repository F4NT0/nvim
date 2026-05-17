--[[ ============================================================================
PLUGIN: catppuccin/nvim
============================================================================
Colour scheme. We start from the official `mocha` flavour and override the
base colour to the GitHub Dark background defined in `config.theme`, so the
editor matches the rest of the toolchain (clidocs installer, terminal, etc.).

Repo: https://github.com/catppuccin/nvim
Docs: Documentations/interface/catppuccin.md
============================================================================ ]]

local theme = require("config.theme")

return {
  "catppuccin/nvim",
  name     = "catppuccin",
  lazy     = false,   -- the colour scheme has to be available immediately
  priority = 1000,    -- load before everything else
  config   = function()
    require("catppuccin").setup({
      flavour    = "mocha",
      background = { dark = "mocha" },
      transparent_background = false,
      no_italic  = true,
      no_bold    = false,
      color_overrides = {
        mocha = {
          base     = theme.bg,
          mantle   = theme.bg_alt,
          crust    = theme.bg_alt,
          surface0 = "#21262d",
          surface1 = "#30363d",
          surface2 = "#484f58",
          text     = theme.fg,
          subtext0 = theme.fg_muted,
          subtext1 = theme.fg_muted,
        },
      },
      custom_highlights = function(_)
        return {
          -- Make floating windows use a consistent light border.
          FloatBorder       = { fg = theme.border, bg = theme.bg_float },
          NormalFloat       = { fg = theme.fg, bg = theme.bg_float },
          WinSeparator      = { fg = theme.border_muted, bg = theme.bg },
          -- Cursor line is a touch lighter than the bg.
          CursorLine        = { bg = "#161b22" },
          CursorLineNr      = { fg = theme.fg_strong, bold = true },
          LineNr            = { fg = theme.fg_muted },
          Visual            = { bg = "#2d3748" },
        }
      end,
      integrations = {
        cmp           = true,
        gitsigns      = true,
        treesitter    = true,
        telescope     = { enabled = true },
        mason         = true,
        native_lsp    = { enabled = true },
        neotree       = true,
        notify        = true,
        noice         = true,
        markdown      = true,
        dap           = true,
        dap_ui        = true,
        indent_blankline = { enabled = true },
        which_key     = false,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
