--[[ ============================================================================
PLUGIN: nvim-telescope/telescope.nvim
============================================================================
Highly extensible fuzzy finder. Used for file/grep/LSP pickers and powers
TodoTelescope (todo-comments) and Telescope-ui-select for vim.ui.select.

Repo: https://github.com/nvim-telescope/telescope.nvim
Docs: Documentations/interface/telescope.md
============================================================================ ]]

local theme = require("config.theme")

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd          = "Telescope",
    event        = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-q>", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<C-s>", function() require("telescope.builtin").live_grep()  end, desc = "Live grep" },
    },
    config = function()
      -- Light borders on dark bg.
      local hi = vim.api.nvim_set_hl
      hi(0, "TelescopeBorder",        { fg = theme.border, bg = theme.bg_float })
      hi(0, "TelescopePromptBorder",  { fg = theme.border, bg = theme.bg_float })
      hi(0, "TelescopeResultsBorder", { fg = theme.border, bg = theme.bg_float })
      hi(0, "TelescopePreviewBorder", { fg = theme.border, bg = theme.bg_float })
      hi(0, "TelescopeNormal",        { fg = theme.fg,     bg = theme.bg_float })
      hi(0, "TelescopeTitle",         { fg = theme.fg_strong, bold = true })
      hi(0, "TelescopeSelection",     { fg = theme.fg_strong, bg = theme.bg_alt, bold = true })
      hi(0, "TelescopeMatching",      { fg = theme.orange, bold = true })

      require("telescope").setup({
        defaults = {
          prompt_prefix     = "   ",
          selection_caret   = "  ",
          path_display      = { "smart" },
          sorting_strategy  = "ascending",
          layout_strategy   = "horizontal",
          layout_config     = {
            horizontal = { prompt_position = "top", width = 0.85, preview_width = 0.55 },
          },
          file_ignore_patterns = { "node_modules", "%.git/", "bin/", "obj/" },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
