--[[ ============================================================================
PLUGIN: kylechui/nvim-surround
============================================================================
Add, change and delete surrounding characters (parentheses, quotes, HTML
tags, function calls…).

Cheat sheet:
  Before           Command       After
  word             ysiw)         (word)
  some text        ys$"          "some text"
  [delete]         ds]           delete
  <b>HTML</b>      dst           HTML
  'word'           cs'"          "word"
  <b>HTML</b>      csth1<CR>     <h1>HTML</h1>
  call(arg)        dsf           arg

Repo: https://github.com/kylechui/nvim-surround
Docs: Documentations/programming/nvim-surround.md
============================================================================ ]]

return {
  "kylechui/nvim-surround",
  version = "^3.0.0",
  event   = "VeryLazy",
  opts    = {},
}
