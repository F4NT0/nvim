--[[

  __  __            _           _               
 |  \/  |          | |         (_)              
 | \  / | __ _ _ __| | ____   ___  _____      __
 | |\/| |/ _` | '__| |/ /\ \ / / |/ _ \ \ /\ / /
 | |  | | (_| | |  |   <  \ V /| |  __/\ V  V / 
 |_|  |_|\__,_|_|  |_|\_\  \_/ |_|\___| \_/\_/  
                                                
]]


--- GITHUB: https://github.com/OXY2DEV/markview.nvim
--- DESCRIPTION: A markdown previewer for neovim
--- COMMANDS:
---   :Markview Toggle
---   :Markview split
---   :Markview hybrid

return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  priority = 49,
  preview = {
    icon_provider = "devicons"
  }
}
