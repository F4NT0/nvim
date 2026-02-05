--[[

PLUGIN CMP

-> DESCRIÇÃO: Serve para ter as opções de autocomplete de código das linguagens
  - nvim-cmp =  serve para a UI.
  - LuaSnip =  serve para mostrar as opções.
  - cmp-nvim-lsp, cmp-buffer, cmp-path, cmp_luasnip =  serve de fontes de autocomplete. 
  - friendly-snippets = serve para um conjunto de opções já existentes.
-> PROJETOS NO GITHUB: 
  - https://github.com/L3MON4D3/LuaSnip
  - https://github.com/hrsh7th/nvim-cmp
  - https://github.com/hrsh7th/cmp-nvim-lsp
  - https://github.com/hrsh7th/cmp-buffer
  - https://github.com/hrsh7th/cmp-path
  - https://github.com/saadparwaiz1/cmp_luasnip
  - https://github.com/rafamadriz/friendly-snippets
-> COMANDOS DE TECLADO:
  - Ctrl + K = Selecione a sugestão anterior
  - Ctrl + J = Selecione a próxima sugestão
  - Ctrl + B ou SETA para cima = suba nas opções
  - Ctrl + F ou SETA para baixo = desce nas opções
  - Ctrl + Space = Ative o menu de opções
  - Ctrl + E = Fecha o menu de opções
  - Enter = Confirma a seleção

--]]

return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "ramamadriz/friendly-snippets",
    },
    {
      "hrsh7th/cmp-nvim-lsp",
    },
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
          completion = {
            competeopt = "menu,menuone,preview,noselect"
          },
          snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
          },
          window = {
            completion = cmp.config.window.bordered({
              border = "rounded",
            }),
            documentation = cmp.config.window.bordered({
              border = "rounded",
            }),
          },
          mapping = cmp.mapping.preset.insert({
              ["<C-k>"] = cmp.mapping.select_prev_item(),
              ["<C-j>"] = cmp.mapping.select_prev_item(),
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-e>"] = cmp.mapping.abort(),
              ["<CR>"] = cmp.mapping.confirm({select = false})
          }),
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
