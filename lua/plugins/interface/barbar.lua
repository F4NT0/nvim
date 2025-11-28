--[[

PLUGIN BARBAR

-> DESCRIÇÃO: Abre novos arquivos como abas dentro do Neovim.
-> PROJETO NO GITHUB: https://github.com/romgrk/barbar.nvim 
-> COMANDOS NO TECLADO:
 - ALT + T = Abre uma tab nova vazia
 - ALT + 1-6 = Move entre as tabs existentes (até no máximo 6 tabs)
 - ALT + C = Fecha a tab atual
 - ALT + , = Vai para a tab anterior
 - ALT + . = Vai para a próxima tab

--]]

return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',    -- Adiciona o status do git na tab 
      'nvim-tree/nvim-web-devicons', -- Adiciona os icones da linguagem na tab
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
    },
    version = '^1.0.0',
  },
}
