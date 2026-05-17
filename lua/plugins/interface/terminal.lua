--[[ ============================================================================
PLUGIN: akinsho/toggleterm.nvim
============================================================================
Floating terminal manager. Also exposes two .NET-aware user commands:

  :DotnetRun       run `dotnet run` on the current C# project / file
  :TermDotnetClose close the persistent .NET terminal
  :TermClose       close the default toggleable terminal

Keymaps:
  <C-t>            toggle the default floating terminal
  <leader>d        :DotnetRun
  <leader>x        :TermDotnetClose
  <leader>ct       :TermClose

Repo: https://github.com/akinsho/toggleterm.nvim
Docs: Documentations/interface/toggleterm.md
============================================================================ ]]

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm", "TermExec", "DotnetRun", "TermDotnetClose", "TermClose" },
  keys = {
    { "<C-t>", desc = "Toggle floating terminal" },
  },
  config = function()
    require("toggleterm").setup({
      open_mapping     = [[<c-t>]],
      hide_numbers     = true,
      direction        = "float",
      float_opts       = { border = "rounded", winblend = 0 },
      shell            = "powershell.exe -NoLogo",
      close_on_exit    = false,
      start_in_insert  = false,
      on_open          = function(_) vim.cmd("stopinsert") end,
    })

    -- ── .NET helpers ─────────────────────────────────────────────────────────
    local Terminal   = require("toggleterm.terminal").Terminal
    local dotnet_term

    local function get_dotnet_term(cmd)
      dotnet_term = Terminal:new({
        direction       = "float",
        size            = 15,
        close_on_exit   = false,
        start_in_insert = false,
        auto_scroll     = false,
        hidden          = true,
        float_opts      = { border = "rounded" },
        on_open         = function(_) vim.cmd("stopinsert") end,
      })
      dotnet_term:open()
      dotnet_term:send(cmd)
      return dotnet_term
    end

    local function close_dotnet_term()
      if dotnet_term and dotnet_term.close then
        dotnet_term:close()
        vim.notify("[.NET terminal] closed", vim.log.levels.INFO)
      else
        vim.notify("[.NET terminal] is not open", vim.log.levels.WARN)
      end
    end

    local function close_default_term()
      local term = require("toggleterm.terminal").get(1)
      if term and term.close then
        term:close()
        vim.notify("[Terminal] closed", vim.log.levels.INFO)
      else
        vim.notify("[Terminal] is not open", vim.log.levels.WARN)
      end
    end

    local function run_dotnet(opts)
      local file = vim.api.nvim_buf_get_name(0)
      if file == "" then
        vim.notify("No file is currently open", vim.log.levels.ERROR)
        return
      end
      local cmd = "dotnet run " .. vim.fn.shellescape(file)
      if opts and opts.args and opts.args ~= "" then
        cmd = cmd .. " -- " .. opts.args
      end
      get_dotnet_term(cmd)
    end

    vim.api.nvim_create_user_command("DotnetRun", run_dotnet, {
      nargs = "*",
      desc  = "Run `dotnet run` against the current .cs/.csproj file",
    })
    vim.api.nvim_create_user_command("TermDotnetClose", close_dotnet_term, { desc = "Close the .NET terminal" })
    vim.api.nvim_create_user_command("TermClose",       close_default_term, { desc = "Close the default toggleable terminal" })

    vim.keymap.set("n", "<leader>d",  ":DotnetRun<CR>",        { desc = "Run with .NET" })
    vim.keymap.set("n", "<leader>x",  ":TermDotnetClose<CR>",  { desc = "Close .NET terminal" })
    vim.keymap.set("n", "<leader>ct", ":TermClose<CR>",        { desc = "Close default terminal" })
  end,
}
