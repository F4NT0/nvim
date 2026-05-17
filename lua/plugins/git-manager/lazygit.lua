--[[ ============================================================================
PLUGIN: kdheepak/lazygit.nvim
============================================================================
Embeds the `lazygit` TUI inside a Neovim floating window. Requires the
`lazygit` binary on PATH (`winget install JesseDuffield.Lazygit` or
`choco install lazygit`). The Go installer checks for and offers to install
lazygit automatically.

Keymaps:
  <C-l>    open lazygit in a floating window

Repo: https://github.com/kdheepak/lazygit.nvim
Docs: Documentations/git-manager/lazygit.md
============================================================================ ]]

return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit", "LazyGitConfig", "LazyGitCurrentFile",
    "LazyGitFilter", "LazyGitFilterCurrentFile",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<C-l>", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
  },
  init = function()
    vim.g.lazygit_floating_window_border_chars = { "╭","─","╮","│","╯","─","╰","│" }
    vim.g.lazygit_floating_window_winblend     = 0
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_use_neovim_remote            = 0
  end,
}
