--[[

PLUGIN TERMINAL

-> DESCRIÇÃO: Inicia o terminal configurado no Windows para abrir dentro do Neovim
-> PROJETO DO GITHUB: https://github.com/akinsho/toggleterm.nvim 
-> COMANDOS DE TECLADO:
  - Ctrl + T = Abre uma tela flutuante com o terminal
-> COMANDOS DO NEOVIM:
  - :ToggleTerm = Abre o Terminal
  - :ToggleTerm direction=vertical = Abre o terminal na vertical
  - :ToggleTerm direction=horizontal = Abre o terminal na horizontal
  - :TermExec cmd="" = Envia um comando para o terminal atual

--]]

return {

  "akinsho/toggleterm.nvim",
  version = "*",

  config = function()
    require("toggleterm").setup {
      open_mapping = [[<c-t>]],
      hide_numbers = true,
      direction = 'float',
      float_ops = {
        border = 'single',
      },
      shell = 'powershell.exe -NoLogo',
    }

  end
}
