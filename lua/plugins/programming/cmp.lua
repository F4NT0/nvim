--[[
                       
   ___ _ __ ___  _ __  
  / __| '_ ` _ \| '_ \ 
 | (__| | | | | | |_) |
  \___|_| |_| |_| .__/ 
                | |    
                |_|    

]]

--- GITHUB:
--- - LuaSnip: https://github.com/L3MON4D3/LuaSnip
--- - nvim-cmp: https://github.com/hrsh7th/nvim-cmp
--- - cmp-nvim-lsp: https://github.com/hrsh7th/cmp-nvim-lsp
--- - cmp-buffer: https://github.com/hrsh7th/cmp-buffer
--- - cmp-path: https://github.com/hrsh7th/cmp-path
--- - cmp_luasnip: https://github.com/saadparwaiz1/cmp_luasnip
--- - friendly-snippets: https://github.com/rafamadriz/friendly-snippets

--- DESCRIPTION:
--- This setup provides a full autocompletion experience in Neovim using:
--- - `nvim-cmp` for the completion engine and UI
--- - `LuaSnip` for snippet expansion
--- - `cmp-nvim-lsp`, `cmp-buffer`, `cmp-path`, and `cmp_luasnip` as completion sources
--- - `friendly-snippets` for a large collection of prebuilt snippets

--- DEPENDENCIES:
--- - LuaSnip (snippet engine)
--- - cmp_luasnip (connects LuaSnip to nvim-cmp)
--- - friendly-snippets (VSCode-style snippets)
--- - cmp-nvim-lsp (LSP source for nvim-cmp)
--- - cmp-buffer (buffer words as completion source)
--- - cmp-path (filesystem paths as completion source)

--- KEYMAPS:
--- These keymaps are defined inside the `cmp.mapping.preset.insert()` block:
--- - `<C-k>`: Select previous suggestion
--- - `<C-j>`: Select next suggestion
--- - `<C-b>`: Scroll documentation up
--- - `<C-f>`: Scroll documentation down
--- - `<C-Space>`: Trigger completion menu
--- - `<C-e>`: Abort/close completion menu
--- - `<CR>` (Enter): Confirm selected suggestion (only if one is selected)

--- NOTES:
--- - `luasnip.loaders.from_vscode.lazy_load()` loads snippets on demand
--- - `cmp.setup()` configures the completion behavior and sources
--- - `completeopt = "menu,menuone,preview,noselect"` improves UX for completion

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
