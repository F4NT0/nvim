--[[ ============================================================================
PLUGIN: hrsh7th/nvim-cmp  +  LuaSnip
============================================================================
Completion engine with multiple sources:
  - cmp-nvim-lsp        completions from attached LSP servers
  - cmp-buffer          completions from words in open buffers
  - cmp-path            file path completions
  - cmp_luasnip         expandable snippets via LuaSnip
  - friendly-snippets   community snippet collection (VSCode format)

Repo: https://github.com/hrsh7th/nvim-cmp
Docs: Documentations/programming/cmp.md
============================================================================ ]]

local theme = require("config.theme")

return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build   = (function()
      if vim.fn.has("win32") == 1 then return nil end
      return "make install_jsregexp"
    end)(),
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
    },
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")

      -- Light borders for completion popups.
      local hi = vim.api.nvim_set_hl
      hi(0, "CmpBorder",           { fg = theme.border, bg = theme.bg_float })
      hi(0, "CmpDocBorder",        { fg = theme.border, bg = theme.bg_float })

      cmp.setup({
        completion = { completeopt = "menu,menuone,noinsert" },
        snippet    = { expand = function(args) luasnip.lsp_expand(args.body) end },
        window = {
          completion    = cmp.config.window.bordered({ border = "rounded", winhighlight = "Normal:NormalFloat,FloatBorder:CmpBorder,CursorLine:PmenuSel" }),
          documentation = cmp.config.window.bordered({ border = "rounded", winhighlight = "Normal:NormalFloat,FloatBorder:CmpDocBorder" }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"]     = cmp.mapping.select_prev_item(),
          ["<C-j>"]     = cmp.mapping.select_next_item(),
          ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
          ["<C-f>"]     = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"]     = cmp.mapping.abort(),
          ["<CR>"]      = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750  },
          { name = "buffer",   priority = 500  },
          { name = "path",     priority = 250  },
        }),
      })
    end,
  },
}
