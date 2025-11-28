--[[
CONFIGURAÇÕES BÁSICAS DO NEOVIM

DESCRIÇÃO: Este arquivo serve para configurar os plugins básicos e configurações do Neovim.
--]]


-- ESTRUTURA DO EDITOR DE TEXTO
vim.cmd("set expandtab") -- converte os tabs em espaços vazios
vim.cmd("set tabstop=2") -- Numero de colunas em cada tab
vim.cmd("set softtabstop=2") -- Multiplos espaços são tabs
vim.cmd("set shiftwidth=2") -- Espaço quando é feito a identação automática
vim.cmd("set number") -- Mostra o numero das linhas
vim.cmd("set autoindent") -- Identa uma nova linha
vim.cmd("syntax on") -- Mostra as cores dos textos
vim.cmd("set clipboard=unnamedplus") -- Podemos colar com Ctrl + C e Ctrl + V
vim.cmd("set cursorline") -- Mostra a linha atual do cursor
vim.cmd("filetype plugin indent on") -- Identa o arquivo dependendo da linguagem
vim.cmd("set mouse=a") -- Libera o click do mouse no VIM
vim.g.mapleader = " " -- Espaço é a principal chave de alguns comandos
vim.filetype.add({extension = { mdx = "markdown", },}) -- Arquivos mdx são reconhecidos como Markdown também

---------------------------------------------------
-- CONFIGURAÇÃO DO GERENCIADOR DE PACOTES LAZY.VIM
---------------------------------------------------

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

------------------------------------------------- 
-- CONFIGURAÇÃO DO FOLDER ONDE FICA OS PLUGINS --
-------------------------------------------------

require("lazy").setup({
    spec = {
        {import = "plugins"}
    },
})

------------------------------------------
-- CONFIGURAÇÃO DOS COMANDOS DE TECLADO --
------------------------------------------

require("config.keymaps")

