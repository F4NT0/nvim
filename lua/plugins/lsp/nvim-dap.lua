--[[

  _   _       _                    _             
 | \ | |     (_)                  | |            
 |  \| |_   ___ _ __ ___ ______ __| | __ _ _ __  
 | . ` \ \ / / | '_ ` _ \______/ _` |/ _` | '_ \ 
 | |\  |\ V /| | | | | | |    | (_| | (_| | |_) |
 |_| \_| \_/ |_|_| |_| |_|     \__,_|\__,_| .__/ 
                                          | |    
                                          |_|    
]]


--- GITHUB: https://github.com/mfussenegger/nvim-dap
--- GITHUB DEPENDENCY: https://github.com/rcarriga/nvim-dap-ui
--- GITHUB DEPENDENCY: https://github.com/nvim-neotest/nvim-nio
--- DESCRIPTION: Debug Adapter Protocol implementation for Neovim

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
  end
}
