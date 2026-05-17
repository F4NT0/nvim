--[[ ============================================================================
PLUGIN: GustavEikaas/easy-dotnet.nvim
============================================================================
Telescope-style menus for everyday .NET tasks: run, test, build, clean,
restore, manage NuGet, secrets, watch, etc. Sits on top of the `dotnet` CLI
so no additional services are required.

Commands:
  :Dotnet run             pick a project and run it
  :Dotnet test            run dotnet test with selectable filters
  :Dotnet build           build the solution / project
  :Dotnet restore         dotnet restore
  :Dotnet secrets         user-secrets manager
  :Dotnet ef              EF Core migrations
  :Dotnet new             scaffold a project from a template
  :Dotnet watch           dotnet watch
  :Dotnet outdated        list outdated NuGet packages

Repo: https://github.com/GustavEikaas/easy-dotnet.nvim
Docs: Documentations/programming/easy-dotnet.md
============================================================================ ]]

return {
  "GustavEikaas/easy-dotnet.nvim",
  ft  = { "cs", "fsharp", "vb", "razor", "cshtml", "xaml" },
  cmd = { "Dotnet", "DotnetUI" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("easy-dotnet").setup({
      test_runner = {
        viewmode      = "float",
        enable_buffer_test_execution = true,
        noBuild       = true,
        noRestore     = true,
        icons = {
          passed   = "",
          failed   = "",
          skipped  = "",
          success  = "",
          reload   = "",
          test     = "",
          sln      = "󰘐",
          project  = "󰘐",
          dir      = "",
          package  = "",
        },
      },
      new = {
        project = { prefix = "sln" },
      },
      terminal = function(path, action)
        local commands = {
          run     = function() return "dotnet run --project " .. path end,
          test    = function() return "dotnet test "     .. path end,
          restore = function() return "dotnet restore "  .. path end,
          build   = function() return "dotnet build "    .. path end,
          watch   = function() return "dotnet watch --project " .. path end,
        }
        local cmd = (commands[action] or function() return "" end)() .. "\r"
        vim.cmd("vsplit | terminal " .. cmd)
      end,
      secrets = { path = function() return vim.fn.getcwd() end },
    })

    vim.keymap.set("n", "<leader>nd", "<cmd>Dotnet run<cr>",   { desc = ".[N]ET run [D]otnet project" })
    vim.keymap.set("n", "<leader>nt", "<cmd>Dotnet test<cr>",  { desc = ".[N]ET run [T]ests" })
    vim.keymap.set("n", "<leader>nb", "<cmd>Dotnet build<cr>", { desc = ".[N]ET [B]uild solution" })
    vim.keymap.set("n", "<leader>nr", "<cmd>Dotnet restore<cr>",{ desc = ".[N]ET [R]estore packages" })
    vim.keymap.set("n", "<leader>ns", "<cmd>Dotnet secrets<cr>",{ desc = ".[N]ET user [S]ecrets" })
  end,
}
