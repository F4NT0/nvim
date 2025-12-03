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

    -- Adaptador para .NET
    -- Instale o netcoredbg no seu computador e verifique com netcoredbg --version
    dap.adapters.coreclr = {
      type = 'executable',
      command = 'C:\\Tools\\netcoredbg\\netcoredbg.exe', -- caminho para o netcoredbg
      args = { '--interpreter=vscode' }
    }

    -- Configurando projeto C#
    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "Iniciando Projeto .NET",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '\\bin\\Debug\\net10.0\\', 'file')
        end,
        cwd = vim.fn.getcwd(),
        console = 'integratedTerminal'
      }
    }
  end
}
