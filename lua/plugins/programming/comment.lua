--[[

PLUGIN COMMENT

-> DESCRIÇÃO: Ajuda a comentar as linhas em um projeto
-> PROJETO NO GITHUB: https://github.com/numToStr/Comment.nvim
-> COMANDOS DE TECLADO:
  - G + C + C = Comenta/Descomenta a linha atual.
  - G + B + C = Comenta/Descomenta o bloco atual de código.
  - Numero + G + C + C = Comenta a linha do numero passado.
  - Numero + G + B + C = Comenta o bloco de código da linha passada.
  - G + C + O = Insere um comentário na próxima linha e entra no modo INSERT.
  - G + C + Shift + O = Insere um comentário na linha anterior e entra no modo INSERT.
  - G + C + Shift + A = Insere um comentário no final do arquivo e entra no modo INSERT.

--]]

return {
  "numToStr/Comment.nvim",
  opts = {}
}
