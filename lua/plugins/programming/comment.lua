--[[ ============================================================================
PLUGIN: numToStr/Comment.nvim
============================================================================
Language-aware toggling of comments.

Keymaps (defaults):
  gcc      toggle current line
  gbc      toggle current block
  gc{op}   toggle line in motion         (e.g. gcap = paragraph)
  gb{op}   toggle block in motion
  gco      insert comment on the line below
  gcO      insert comment on the line above
  gcA      insert comment at the end of the current line

Repo: https://github.com/numToStr/Comment.nvim
Docs: Documentations/programming/comment.md
============================================================================ ]]

return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts  = {},
}
