return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      -- Feed luasnip suggestion to CMP
      "saadparwaiz1/cmp_luasnip",
      -- Provide VSCODE like snippets to CMP
      "ramamadriz/friendly-snippets",
    },
    -- cmp-nvim-lsp provides language specific completion suggestions to nvim-cmp
    {
      "hrsh7th/cmp-nvim-lsp",
    },
    -- nvim-cmp provides auto completion and auto completion dropdown UI
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        -- buffer based completion options
        "hrsh7th/cmp-buffer",
        -- Path based completion options
        "hrsh7th/cmp-path",
      },
      config = function()
        -- Gain access to the functions of the CMP plugin
        local cmp = require("cmp")
        -- Gain access to the function of the luasnip plugin
        local luasnip = require("luasnip")
        
        -- Lazily load the vscode snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- All the CMP setup function to configure our completion experience
        cmp.setup({
          -- How should completion options be displayed to us?
          completion = {
            -- menu: display options in a menu
            -- menuone: automatically select the first option of the menu
            -- preview: automatically display the completion candidate as you navigate the menu
            -- noselect: prevent neovim from automatically selecting a completion option while navigating the menu
            competeopt = "menu,menuone,preview,noselect"
          },
          -- Setup snippet into our project
          snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
          },
          -- Keymap section
          mapping = cmp.mapping.preset.insert({
              -- Ctrl + K = Previous suggestion
              ["<C-k>"] = cmp.mapping.select_prev_item(),
              -- Ctrl + J = Next Suggestion
              ["<C-j>"] = cmp.mapping.select_prev_item(),
              -- Ctrl + B = Scroll docs below
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              -- Show completion suggestion
              ["<C-Space>"] = cmp.mapping.complete(),
              -- Ctrl + F = Scroll docs above
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              -- Ctrl + E = Close Completion Window
              ["<C-e>"] = cmp.mapping.abort(),
              -- Enter = Confirm Selection, only when selected an option
              ["<CR>"] = cmp.mapping.confirm({select = false})
          }),
          -- Ranking Completions (first is the most important
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
          })
        })
      end
    }
  }
}
