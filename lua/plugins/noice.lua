------------------------------------
--  _   _  ____ _____ _____ ______ 
-- | \ | |/ __ \_   _/ ____|  ____|
-- |  \| | |  | || || |    | |__   
-- | . ` | |  | || || |    |  __|  
-- | |\  | |__| || || |____| |____ 
-- |_| \_|\____/_____\_____|______|
------------------------------------
--
-- Noice is a replacement for the Neovim UI. 
-- It completely replaces the UI for messages, cmdline and the popupmenu.
--
-- Dependencies:
--   MunifTanjim/nui.nvim
--   rcarriga/nvim-notify = Create a notification messages that show in the right
--
-- Commands:
--  :Noice: Open the noice UI
--  :Noice last: See the last message
--  :Noice history: See the message history
--  :Noice dismiss: Dismiss all messages

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
}
