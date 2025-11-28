--[[

PLUGIN MARKVIEW

-> DESCRIÇÃO: Visualizador de arquivos Markdown para documentação
-> PROJETO NO GITHUB: https://github.com/OXY2DEV/markview.nvim 
-> COMANDOS PARA USAR NO TERMINAL DO NEOVIM:
  - :Markview Toggle = Liga/Desliga a visualização
  - :Markview split = Divide a tela em código e na visualização
  - :Markview hybrid = Vai alterando entre as visualizações
--]]

return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  priority = 49,
  config = function()
    require("markview").setup({
      preview = {
        filetypes = { "markdown", "mdx" },
      }
    })
  end,
  preview = {
    icon_provider = "devicons"
  }
}
