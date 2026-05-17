--[[ ============================================================================
PLUGIN: folke/todo-comments.nvim
============================================================================
Detects, highlights and lists project-wide task comments. Requires `ripgrep`
on PATH for the search-based commands.

Recognised keywords (capitalised, followed by a colon):
  FIX:    something is broken
  TODO:   work to do
  HACK:   short-term workaround
  WARN:   take care here
  PERF:   performance note
  NOTE:   informational comment

Commands:
  :TodoTelescope    list every TODO in the project (mapped to <leader>td)
  :TodoQuickFix     open quickfix with every TODO
  :TodoLocList      open location list

Repo: https://github.com/folke/todo-comments.nvim
Docs: Documentations/programming/todo-comments.md
============================================================================ ]]

return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cmd   = { "TodoTelescope", "TodoQuickFix", "TodoLocList" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs    = true,
    keywords = {
      FIX  = { icon = "", color = "error",   alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      TODO = { icon = "", color = "info"    },
      HACK = { icon = "", color = "warning" },
      WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = "",  color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "", color = "hint",   alt = { "INFO" } },
      TEST = { icon = "⏲", color = "test",   alt = { "TESTING", "PASSED", "FAILED" } },
    },
  },
}
