--[[

   _____                                     _   
  / ____|                                   | |  
 | |     ___  _ __ ___  _ __ ___   ___ _ __ | |_ 
 | |    / _ \| '_ ` _ \| '_ ` _ \ / _ \ '_ \| __|
 | |___| (_) | | | | | | | | | | |  __/ | | | |_ 
  \_____\___/|_| |_| |_|_| |_| |_|\___|_| |_|\__|

]]


--- GITHUB: https://github.com/numToStr/Comment.nvim
--- DESCRIPTION: This plugins help to improve comment lines in a project
---
--- COMMANDS:
---  NORMAL MODE:
---     -> gcc = toggle the current line
---     -> gbc = toggle the current block
---     -> number + gcc = toggle the number of lines
---     -> number + gbc = toggle the number of blocks
---     -> gco = Insert the comment of the next lines and enter INSERT mode
---     -> gcO = Insert the comment of the previous lines and enter INSERT mode
---     -> gcA = Insert the comment in the end of the current line and enter INSERT mode

return {
  "numToStr/Comment.nvim",
  opts = {}
}
