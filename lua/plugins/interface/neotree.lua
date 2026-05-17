--[[ ============================================================================
PLUGIN: nvim-neo-tree/neo-tree.nvim
============================================================================
File explorer sidebar. Shows the project tree, git status, buffers and
filesystem operations. Hidden files are visible by default.

Repo: https://github.com/nvim-neo-tree/neo-tree.nvim
Docs: Documentations/interface/neo-tree.md
============================================================================ ]]

local theme = require("config.theme")

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd    = "Neotree",
  keys   = {
    { "<C-f>", "<cmd>Neotree filesystem reveal left<cr>", desc = "Open file explorer" },
    { "<C-x>", "<cmd>Neotree close<cr>",                   desc = "Close file explorer" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Custom highlights so the explorer matches the global theme.
    local hi = vim.api.nvim_set_hl
    hi(0, "NeoTreeNormal",          { fg = theme.fg,         bg = theme.bg })
    hi(0, "NeoTreeNormalNC",        { fg = theme.fg,         bg = theme.bg })
    hi(0, "NeoTreeEndOfBuffer",     { fg = theme.bg,         bg = theme.bg })
    hi(0, "NeoTreeFloatBorder",     { fg = theme.border,     bg = theme.bg_float })
    hi(0, "NeoTreeFloatTitle",      { fg = theme.fg_strong,  bg = theme.bg_float, bold = true })
    hi(0, "NeoTreeWinSeparator",    { fg = theme.border_muted, bg = theme.bg })
    hi(0, "NeoTreeRootName",        { fg = theme.orange,     bold = true })
    hi(0, "NeoTreeDirectoryName",   { fg = theme.fg })
    hi(0, "NeoTreeDirectoryIcon",   { fg = theme.blue })
    hi(0, "NeoTreeFileName",        { fg = theme.fg })
    hi(0, "NeoTreeFileNameOpened",  { fg = theme.orange,     bold = true })
    hi(0, "NeoTreeTitleBar",        { fg = theme.fg_strong,  bg = theme.bg_alt })
    hi(0, "NeoTreeGitAdded",        { fg = theme.git_added })
    hi(0, "NeoTreeGitModified",     { fg = theme.git_modified })
    hi(0, "NeoTreeGitDeleted",      { fg = theme.git_deleted })
    hi(0, "NeoTreeGitRenamed",      { fg = theme.git_renamed })
    hi(0, "NeoTreeGitUntracked",    { fg = theme.git_untracked,    bold = true })
    hi(0, "NeoTreeGitConflict",     { fg = theme.red,        bold = true })
    hi(0, "NeoTreeGitStaged",       { fg = theme.blue })
    hi(0, "NeoTreeIndentMarker",    { fg = theme.border_muted })

    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style   = "rounded",
      enable_git_status    = true,
      enable_diagnostics   = true,
      default_component_configs = {
        indent = { padding = 1, with_markers = true, indent_marker = "│", last_indent_marker = "└" },
        git_status = {
          symbols = {
            added     = "",
            modified  = "",
            deleted   = "󰧧",
            renamed   = "󰑕",
            untracked = "★",
            ignored   = "◌",
            unstaged  = "✗",
            staged    = "✓",
            conflict  = "",
          },
        },
      },
      window = {
        position = "left",
        width    = 32,
        popup = {
          size     = { height = "85%", width = "60%" },
          position = "50%",
          border   = { style = "rounded", highlight = "NeoTreeFloatBorder" },
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible         = true,
          hide_dotfiles   = false,
          hide_gitignored = false,
        },
      },
    })
  end,
}
