--------------------------------------------
--  _                           _ _   
-- | |                         (_) |  
-- | |     __ _ _____   _  __ _ _| |_ 
-- | |    / _` |_  / | | |/ _` | | __|
-- | |___| (_| |/ /| |_| | (_| | | |_ 
-- |______\__,_/___|\__, |\__, |_|\__|
--                   __/ | __/ |      
--                  |___/ |___/       
--------------------------------------------
---
-- GITHUB: https://github.com/kdheepak/lazygit.nvim
-- OBSERVATION: Install LazyGit before use in Neovim
-- COMMAND: choco install lazygit / winget install --id=JesseDuffield.Lazygit -e
-- DESCRIPTION: This project is going to open Lazygit in a floatin pannel

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
