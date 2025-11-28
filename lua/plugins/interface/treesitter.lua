--[[

PLUGIN TREESITTER

-> DESCRIÇÃO: Mostra cores e identa o código para diferentes linguagens
-> PROJETO NO GITHUB: https://github.com/nvim-treesitter/nvim-treesitter
-> ATENÇÃO: Precisa instalar o MSYS2 instalado com GCC
  - LINK: https://www.msys2.org/
  - Não esqueça de adicionar o PATH nas variáveis de ambiente
-> ATENÇÃO 2: Precisa instalar o tree-sitter-cli primeiro
  - npm install -g tree-sitter-cli

--]]

return {

  ---------------- 
  -- INSTALAÇÃO --
  ----------------

  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",

  ------------------
  -- CONFIGURAÇÃO --
  ------------------

  config = function()
    local tree = require("nvim-treesitter.configs")
    tree.setup({
      ensure_installed = {
        "lua",
        "c_sharp",
        "java",
        "powershell",
        "toml",
        "sql",
        "json",
        "yaml",
        "xml",
        "latex",
        "markdown",
        "markdown_inline"
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}

