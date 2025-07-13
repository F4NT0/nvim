------------------------------------------------------
--           _     _      _       _
--          | |   (_)    | |     | |
-- __      _| |__  _  ___| |__   | | _____ _   _
-- \ \ /\ / / '_ \| |/ __| '_ \  | |/ / _ \ | | |
--  \ V  V /| | | | | (__| | | | |   <  __/ |_| |
--   \_/\_/ |_| |_|_|\___|_| |_| |_|\_\___|\__, |
--                                          __/ |
--                                         |___/
------------------------------------------------------
-- GITHUB: https://github.com/folke/which-key.nvim
-- DESCRIPTION: Plugin to search for the keymaps available in this Neovim
-- COMMAND: Ctrl + ?


return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = {
      marks = true,       -- shows a list of your marks on ' and `
      registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
    },
    window = {
      border = "double",        -- none, single, double, shadow
      position = "bottom",      -- bottom, top
      margin = { 1, 0, 1, 0 },  -- top, right, bottom, left
      padding = { 2, 2, 2, 2 }, -- top, right, bottom, left
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3,                    -- spacing between columns
      align = "left",                 -- align columns left, center or right
    },
  },
  config = function(_, opts)
    local which_key = require("which-key")
    which_key.setup(opts)

    -- Set background color
    vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "#0d1117" })

    which_key.register({
      c = { name = "[C]ode", _ = "which_key_ignore" },
      d = { name = "[D]ebug", _ = "which_key_ignore" },
      J = { name = "[J]ava", _ = "which_key_ignore" },
      ["<leader>"] = { name = "Leader Actions", _ = "which_key_ignore" },
    })
  end,
  keys = {
    {
      "<leader>wk",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Show All Keymaps (which-key)",
    },
  },
}
