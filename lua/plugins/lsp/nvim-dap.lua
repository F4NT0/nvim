return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- UI plugin to make debugging simplifier
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio"
  },

  config = function()
    -- Gain access to the DAP plugin and it's functions
    local dap = require("dap")
    -- Gain acces to the DAP UI plugin
    local dapui = require("dapui")

    -- Setup de DAPUI
    dapui.setup()

    -- Setup an event listener
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    ------------
    -- COMMANDS
    ------------ 
    
    

  end
}
