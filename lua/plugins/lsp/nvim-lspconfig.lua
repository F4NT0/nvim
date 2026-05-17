--[[ ============================================================================
PLUGIN: neovim/nvim-lspconfig
============================================================================
Per-server configuration helpers for the built-in LSP client. Uses Neovim
0.11+ APIs (`vim.lsp.config` / `vim.lsp.enable`). Capabilities are widened
with cmp-nvim-lsp so the LSP knows about completion features.

Keymaps for `LspAttach` are defined here so they only become active once a
server actually attaches to a buffer.

Repo: https://github.com/neovim/nvim-lspconfig
Docs: Documentations/lsp/nvim-lspconfig.md
============================================================================ ]]

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    -- Diagnostic icons (used by the sign column + tiny-inline-diagnostic).
    local signs = { Error = "✘", Warn = "▲", Info = "", Hint = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text     = false,            -- replaced by tiny-inline-diagnostic
      signs            = true,
      underline        = true,
      update_in_insert = false,
      severity_sort    = true,
      float            = { border = "rounded" },
    })

    -- Hover/signature popups with rounded borders.
    vim.lsp.handlers["textDocument/hover"]         = vim.lsp.with(vim.lsp.handlers.hover,         { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,{ border = "rounded" })

    -- Build wide capabilities from cmp-nvim-lsp.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if ok_cmp then
      capabilities = cmp_lsp.default_capabilities(capabilities)
    end

    -- Per-server settings. Names match the lspconfig server names.
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            workspace   = { checkThirdParty = false },
            telemetry   = { enable = false },
            diagnostics = { globals = { "vim" } },
            completion  = { callSnippet = "Replace" },
          },
        },
      },
      yamlls = {
        settings = { yaml = { keyOrdering = false } },
      },
      jsonls   = {},
      bashls   = {},
      -- `roslyn` is configured by seblyng/roslyn.nvim. We still register
      -- capabilities so the plugin picks them up.
      roslyn   = {},
    }

    for name, cfg in pairs(servers) do
      cfg.capabilities = capabilities
      vim.lsp.config(name, cfg)
    end

    -- ── LspAttach keymaps ────────────────────────────────────────────────────
    vim.api.nvim_create_autocmd("LspAttach", {
      group    = vim.api.nvim_create_augroup("lsp_attach_keymaps", { clear = true }),
      callback = function(args)
        local buf = args.buf
        local map = function(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = buf, silent = true, desc = desc })
        end
        local ts = require("telescope.builtin")
        map("<leader>ch", vim.lsp.buf.hover,        "[C]ode [H]over documentation")
        map("<leader>cd", vim.lsp.buf.definition,   "[C]ode goto [D]efinition")
        map("<leader>ca", vim.lsp.buf.code_action,  "[C]ode [A]ctions")
        map("<leader>cr", ts.lsp_references,         "[C]ode goto [R]eferences")
        map("<leader>ci", ts.lsp_implementations,    "[C]ode goto [I]mplementations")
        map("<leader>cR", vim.lsp.buf.rename,        "[C]ode [R]ename symbol")
        map("<leader>cD", vim.lsp.buf.declaration,   "[C]ode goto [D]eclaration")
        map("<leader>sd", vim.diagnostic.open_float, "[S]how [D]iagnostic float")
        map("<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "[C]ode [F]ormat")
        map("<leader>dl", vim.diagnostic.setloclist, "[D]iagnostics [L]ist")
      end,
    })
  end,
}
