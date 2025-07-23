-- Basic configurations from Vim
vim.cmd("set expandtab") -- convert tabs to white spaces
vim.cmd("set tabstop=2") -- number of columns occupied by tabs
vim.cmd("set softtabstop=2") -- see multiple spaces as tabs
vim.cmd("set shiftwidth=2") -- width from autoindent
vim.cmd("set number") -- Show line numbers
vim.cmd("set autoindent") -- Indent a new line
vim.cmd("syntax on") -- Syntax Highlight
vim.cmd("set clipboard=unnamedplus") -- Using system clipboard
vim.cmd("set cursorline") -- Hightlight current cursor line
vim.cmd("filetype plugin indent on") -- Allow auto indent depending of file type
vim.cmd("set mouse=a") -- Enable mouse click
vim.g.mapleader = " "

-----------------------------------------
-- LAZY.VIM PACKAGE MANAGER INSTALLATION
-----------------------------------------

local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--------------------- 
-- PLUGINS FOLDER  --
---------------------
require("lazy").setup({
    spec = {
        {import = "plugins"}
    },
})

--------------------------
-- CONFIGURATION FOLDER --
--------------------------

-- Load the configurations for the JDTLS
require("config.keymaps")

