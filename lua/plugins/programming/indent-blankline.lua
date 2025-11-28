--[[

PLUGIN INDENT-BLANKLINE

-> DESCRIÇÃO: Mostra uma linha que apresenta o inicio e o fim do bloco de código identado
-> PROJETO NO GITHUB: https://github.com/lukas-reineke/indent-blankline.nvim

--]]


return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      exclude = {
        filetypes = {
         "dashboard"
      },
    },
  },
}
