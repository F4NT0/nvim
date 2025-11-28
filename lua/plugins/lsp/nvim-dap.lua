--[[

PLUGIN NVIM-DAP

-> DESCRIÇÃO: Plugin para fazer debug no código pelo Neovim.
-> PROJETOS NO GITHUB:
  - https://github.com/mfussenegger/nvim-dap
  - https://github.com/rcarriga/nvim-dap-ui
  - https://github.com/nvim-neotest/nvim-nio

--]]

----------------
-- INSTALAÇÃO --
---------------- 

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio"
  },


  ------------------
  -- CONFIGURAÇÃO --
  ------------------

  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
  end
}
