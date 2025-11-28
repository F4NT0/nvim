--[[

PLUGIN TELESCOPE

-> DESCRIÇÃO: Esse plugin auxilia em busca de arquivos, palavras e outras configurações de UI
-> PROJETO NO GITHUB: https://github.com/nvim-telescope/telescope.nvim

--]]

return {

  {
    "nvim-telescope/telescope.nvim", tag = "0.1.7",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      -- Configuração de cores
      vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#888A88' })
      vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = '#888A88' })
      vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = '#888A88' })
      vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = '#888A88' })
    end
  },
  {
    ------------------
    -- TELESCOPE UI --
    ------------------

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
