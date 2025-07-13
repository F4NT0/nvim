------------------------------------------------
--  _____    _                                
-- |_   _|__| | ___  ___  ___ ___  _ __   ___ 
--   | |/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \
--   | |  __/ |  __/\__ \ (_| (_) | |_) |  __/
--   |_|\___|_|\___||___/\___\___/| .__/ \___|
--                                |_|         
--------------------------------------------------
--- GITHUB: https://github.com/nvim-telescope/telescope.nvim
--- DESCRIPTION: telescope.nvim is a highly extendable fuzzy finder over lists

return {

  {
    ---------------------
    -- BASIC TELESCOPE --
    ---------------------

    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      
    end

  },
  {
    ------------------------------
    -- TELESCOPE UI FOR ACTIONS --
    ------------------------------

    "nvim-telescope/telescope-ui-select.nvim",

    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown{}
          }
        }

      })
      require("telescope").load_extension("ui-select")
    end
  }
}
