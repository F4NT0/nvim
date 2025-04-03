

-- OBSERVATION: install lazygit before connect to neovim

return {

  ------------------ 
  -- INSTALLATION --
  ------------------
  "kdheepak/lazygit.nvim",

  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },

  -- To create a windows floating
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- Key binding
  keys = {
    { "lg", "<cmd>LazyGit<cr>", desc = "Open Lazy Git" },
  },

}
