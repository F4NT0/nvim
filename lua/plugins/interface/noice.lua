--[[

PLUGIN NOICE

-> DESCRIÇÃO: Mostra uma melhoria na visualização da UI de enviar comandos, cli e popups 
-> PROJETO NO GITHUB: https://github.com/folke/noice.nvim 
-> COMANDOS PARA O NEOVIM:
  - :Noice = Abre a UI
  - :Noice last = Mostra a ultima mensagem
  - :Noice history = Mostra o histórico de comandos
  - :Noice dismiss = Finaliza todas as mensagens

--]]

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
