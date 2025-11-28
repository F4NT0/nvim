--[[

PLUGIN NVIM-SURROUND

DESCRIÇÃO: Plugin para ajudar a colocar "" e () no código
PROJETO NO GITHUB: https://github.com/kylechui/nvim-surround
COMANDOS DE TECLADO:
  - Y + S + I + W + ) = Coloca () na palavra atual
  - Y + S + $ + " = Coloca "" no próximo texto depois do cursor
  - D + S + ] = Deleta o [] em volta da palavra
  - D + S + T = Remove a tag HTML interna
  - C + S + ' + " = Altera de '' para "" na palavra atual
  - C + S + T + H + 1 + Enter = Altera o valor da tag da palavra atual
  - D + S + F = Remove função e deixa somente a palavra do atributo
EXEMPLOS:
    Palavra antiga |  Comando   |   Como fica
  -----------------|------------|-----------------
    palavra        |   ysiw)    |    (palavra)
    texto string   |   ys$"     |   "texto string"
    [deleta]       |   ds]      |   deleta 
    <b>HTML</b>    |   dst      |   HTML
    'palavra'      |   cs'"     |   "palavra"
    <b>HTML</b>    |  csth1<CR> | <h1>HTML</h1>
    deleta(funcao) |   dsf      | function

--]]

return {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
        })
    end
}
