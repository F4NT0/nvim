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
    
    -- d + t -> Toggle a breakpoint at the line 
    vim.keymap.set('n', 'dt', dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })
    -- d + s -> Start the debugger
    vim.keymap.set('n','ds', dap.continue, { desc = "[D]ebug [S]tart" })
    -- d + c -> Close the Debugging UI
    vim.keymap.set('n','dc', dapui.close, { desc = "[D]ebug [C]lose" })

  end
}
