--[[ ============================================================================
PLUGIN: williamboman/mason.nvim  +  mason-lspconfig.nvim
============================================================================
Mason is a portable package manager for LSP servers, DAP adapters, linters
and formatters. mason-lspconfig bridges Mason package names to lspconfig
server names so `vim.lsp.config()` calls in `nvim-lspconfig.lua` Just Work.

A custom registry is added for `roslyn` (the C# LSP) which is published by
`Crashdummyy` instead of the official mason-registry.

Requires:
  - .NET SDK 8/9 on PATH         (for csharpier and roslyn at runtime)
  - Node.js on PATH              (for prettier, typescript-language-server)
  - PowerShell 7+ or pwsh on PATH

Repo: https://github.com/williamboman/mason.nvim
      https://github.com/williamboman/mason-lspconfig.nvim
Docs: Documentations/lsp/mason.md
============================================================================ ]]

return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall", "MasonLog" },
    build = ":MasonUpdate",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",  -- exposes `roslyn` and `rzls`
      },
      ui = {
        border = "rounded",
        icons = {
          package_installed   = "",
          package_pending     = "",
          package_uninstalled = "",
        },
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)

      -- Install the non-LSP tooling we rely on (formatters / linters).
      local ensure = { "csharpier", "prettier", "stylua" }
      local registry = require("mason-registry")
      registry.refresh(function()
        for _, name in ipairs(ensure) do
          local ok, pkg = pcall(registry.get_package, name)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
        end
      end)
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      -- LSP servers that should be auto-installed and auto-enabled.
      ensure_installed = {
        "lua_ls",
        "yamlls",
        "jsonls",
        "bashls",
        -- C# (roslyn) is handled by the seblyng/roslyn.nvim plugin spec.
      },
      automatic_installation = true,
    },
  },
}
