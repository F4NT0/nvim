--[[ ============================================================================
PLUGIN: mfussenegger/nvim-dap  +  rcarriga/nvim-dap-ui
============================================================================
Debug Adapter Protocol client + a stylised UI. Configured for .NET via
`netcoredbg` (https://github.com/Samsung/netcoredbg/releases). The Go installer
verifies that netcoredbg is on PATH and provides a default install location.

Keymaps:
  <leader>dt    toggle breakpoint
  <leader>ds    start / continue
  <leader>dc    close debug UI
  <leader>do    step over
  <leader>di    step into
  <leader>du    step out

Repo: https://github.com/mfussenegger/nvim-dap
      https://github.com/rcarriga/nvim-dap-ui
Docs: Documentations/lsp/nvim-dap.md
============================================================================ ]]

local theme = require("config.theme")

return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap   = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      floating = { border = "rounded" },
    })

    -- Lifecycle hooks: open the UI when a session starts, close on terminate.
    dap.listeners.before.attach.dapui_config           = function() dapui.open() end
    dap.listeners.before.launch.dapui_config           = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config     = function() dapui.close() end

    -- Diagnostic signs for breakpoints.
    local hi = vim.api.nvim_set_hl
    hi(0, "DapBreakpoint",       { fg = theme.red })
    hi(0, "DapStopped",          { fg = theme.green })
    hi(0, "DapBreakpointRejected", { fg = theme.orange })
    vim.fn.sign_define("DapBreakpoint",         { text = "●", texthl = "DapBreakpoint" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DapBreakpointRejected" })
    vim.fn.sign_define("DapStopped",            { text = "▶", texthl = "DapStopped" })

    -- ── .NET / netcoredbg adapter ────────────────────────────────────────────
    -- Try a couple of conventional locations; users can override via env var.
    local netcoredbg = os.getenv("NETCOREDBG")
      or "C:\\Tools\\netcoredbg\\netcoredbg.exe"

    dap.adapters.coreclr = {
      type    = "executable",
      command = netcoredbg,
      args    = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type    = "coreclr",
        name    = "Launch .NET project",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "\\bin\\Debug\\net9.0\\", "file")
        end,
        cwd     = vim.fn.getcwd(),
        console = "integratedTerminal",
      },
    }

    -- ── Keymaps ──────────────────────────────────────────────────────────────
    vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle breakpoint" })
    vim.keymap.set("n", "<leader>ds", dap.continue,           { desc = "[D]ebug [S]tart / continue" })
    vim.keymap.set("n", "<leader>dc", dapui.close,            { desc = "[D]ebug [C]lose UI" })
    vim.keymap.set("n", "<leader>do", dap.step_over,          { desc = "[D]ebug step [O]ver" })
    vim.keymap.set("n", "<leader>di", dap.step_into,          { desc = "[D]ebug step [I]nto" })
    vim.keymap.set("n", "<leader>du", dap.step_out,           { desc = "[D]ebug step o[U]t" })
  end,
}
