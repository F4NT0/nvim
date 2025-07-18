--[[
  _   _       _   
 | \ | |     (_)         
 |  \| | ___  _  ___ ___ 
 | . ` |/ _ \| |/ __/ _ \
 | |\  | (_) | | (_|  __/
 |_| \_|\___/|_|\___\___|

]]

--- GITHUB: https://github.com/folke/noice.nvim
--- DESCRIPTION: This plugin replaces UI from the commands, cmdline and popups
--- COMMANDS:
---  :Noice: Open the noice UI
---  :Noice last: See the last message
---  :Noice history: See the message history
---  :Noice dismiss: Dismiss all messages

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
