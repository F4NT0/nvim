--[[

PLUGIN LAZYGIT

-> DESCRIÇÃO: Este plugin conecta o software lazygit no Neovim, abre uma tela flutuante.
-> info: Precisa instalar o programa Lazygit antes: choco install lazygit / winget install --id=JesseDuffield.Lazygit -e
-> PROJETO NO GITHUB: https://github.com/kdheepak/lazygit.nvim 
-> COMANDOS DE TECLADO:
  - CTRL + L = Abre o Lazygit no Neovim.

--]]

return {
  "kdheepak/lazygit.nvim",

  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- Key binding
  keys = {
    { "<C-l>", "<cmd>LazyGit<cr>", desc = "Open Lazy Git" },
  },
}
