--[[

PLUGIN MASON

-> DESCRIÇÃO: Este projeto é um gerenciador de LSP para instalar configurações de linguagens
-> PROJETOS NO GITHUB: 
  - https://github.com/williamboman/mason.nvim
  - https://github.com/williamboman/mason-lspconfig.nvim
  - https://github.com/williamboman/
-> ATENÇÃO:
  - Precisa ter instalado o .NET no seu computador.
  - Adicione a seguinte ferramenta no seu terminal: dotnet tool install --global csharp-ls
]]

return {

  ----------- 
  -- MASON --
  -----------

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        registries = {
          -- Esses registros são para instalar o roslyn no Neovim (para C#)
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
        ui = {
          icons = {
           package_installed = "",
           package_pending = "",
           package_uninstalled = "",  
          },
        },
        ensure_installed = {
          "lua-language-server",
          "csharpier",
          "prettier",
          "roslyn",
        }
      })
    end
  },

  ---------------------
  -- MASON LSPCONFIG --
  ---------------------

  --- Próxima parte da configuração se encontra em nvim-lspconfig.lua.
  --- Adicione a configuração de cada linguagem aqui para ele instalar automaticamente.

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "yamlls",
        },
        automatic_enable = true,
      })
    end
  }
}

