--[[ ============================================================================
PLUGIN: nvim-neotest/neotest  +  Issafalcon/neotest-dotnet
============================================================================
Test runner framework. The `.NET` adapter discovers xUnit, NUnit and MSTest
test classes inside the current solution and lets you run them under the
cursor, in the file or the entire suite.

Keymaps:
  <leader>tn    run the nearest test
  <leader>tf    run all tests in the current file
  <leader>ta    run every test in the project
  <leader>ts    open the test summary panel
  <leader>to    open the output of the last run

Repo: https://github.com/nvim-neotest/neotest
      https://github.com/Issafalcon/neotest-dotnet
Docs: Documentations/programming/neotest.md
============================================================================ ]]

return {
  "nvim-neotest/neotest",
  ft = { "cs", "fsharp", "vb" },
  cmd = { "Neotest" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "Issafalcon/neotest-dotnet",
  },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-dotnet")({
          dap = { args = { justMyCode = false }, adapter_name = "coreclr" },
          discovery_root = "solution", -- "project" or "solution"
        }),
      },
      output      = { open_on_run = true },
      output_panel = { enabled = true, open = "botright split | resize 15" },
      quickfix    = { enabled = false },
      icons = {
        passed     = "",
        failed     = "",
        running    = "",
        skipped    = "",
        unknown    = "",
        watching   = "",
      },
      floating = { border = "rounded", max_height = 0.8, max_width = 0.8 },
    })

    vim.keymap.set("n", "<leader>tn", function() neotest.run.run()                          end, { desc = "[T]est [N]earest" })
    vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%"))         end, { desc = "[T]est current [F]ile" })
    vim.keymap.set("n", "<leader>ta", function() neotest.run.run(vim.fn.getcwd())            end, { desc = "[T]est [A]ll" })
    vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle()                    end, { desc = "[T]est [S]ummary" })
    vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = true })       end, { desc = "[T]est [O]utput" })
  end,
}
