--[[ ============================================================================
PLUGIN: lewis6991/gitsigns.nvim
============================================================================
Renders hunk signs in the sign column, supplies stage/reset/blame helpers
and feeds neo-tree / lualine with git status data.

Keymaps:
  <leader>hs    stage hunk
  <leader>hr    reset (undo) hunk
  <leader>hS    stage entire buffer
  <leader>hR    reset entire buffer
  <leader>hp    preview hunk under the cursor
  <leader>hb    toggle line blame
  ]c / [c       jump to next / previous hunk

Repo: https://github.com/lewis6991/gitsigns.nvim
Docs: Documentations/git-manager/gitsigns.md
============================================================================ ]]

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gs = require("gitsigns")
    gs.setup({
      signs = {
        add          = { text = "┃" },
        change       = { text = "┃" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "┆" },
      },
      signs_staged_enable      = true,
      signcolumn               = true,
      current_line_blame       = false,
      current_line_blame_opts  = { virt_text = true, virt_text_pos = "eol", delay = 500 },
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
      preview_config           = { border = "rounded", style = "minimal", relative = "cursor", row = 0, col = 1 },
      max_file_length          = 40000,
      on_attach = function(buf)
        local function map(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = buf, silent = true, desc = desc })
        end
        map("<leader>hs", gs.stage_hunk,       "[H]unk [S]tage")
        map("<leader>hr", gs.reset_hunk,        "[H]unk [R]eset")
        map("<leader>hS", gs.stage_buffer,      "[H]unk stage entire [B]uffer")
        map("<leader>hR", gs.reset_buffer,      "[H]unk reset entire buffer")
        map("<leader>hp", gs.preview_hunk,      "[H]unk [P]review")
        map("<leader>hb", function() gs.blame_line({ full = true }) end, "[H]unk [B]lame line")
        map("]c",         function() gs.nav_hunk("next") end, "Next hunk")
        map("[c",         function() gs.nav_hunk("prev") end, "Previous hunk")
      end,
    })
  end,
}
