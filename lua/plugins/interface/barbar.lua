--[[
  _                _
 | |              | |
 | |__   __ _ _ __| |__   __ _ _ __
 | '_ \ / _` | '__| '_ \ / _` | '__|
 | |_) | (_| | |  | |_) | (_| | |
 |_.__/ \__,_|_|  |_.__/ \__,_|_|

]]

--- GITHUB: https://github.com/romgrk/barbar.nvim
--- DESCRIPTION: Plugin to improve the creation and usage of Tabs in Neovim
--- COMMANDS:
---  - ALT + T = open new tab empty
---  - ALT + 1-6 = move between tabs
---  - ALT + C = close current tab
---  - ALT + , = go to previous tab
---  - ALT + . = got to next tab

return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
