--[[ ============================================================================
PLUGIN: nvimdev/dashboard-nvim
============================================================================
Start screen shown when Neovim is launched without arguments. Provides quick
actions for finding files, searching content, opening the file tree, running
LazyGit and listing TODO comments.

Repo: https://github.com/nvimdev/dashboard-nvim
Docs: Documentations/interface/dashboard.md
============================================================================ ]]

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("dashboard").setup({
      theme  = "doom",
      config = {
        header = {
          "",
          "====================================================================",
          " ██╗      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗        ",
          " ╚██╗     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║        ",
          "  ╚██╗    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║        ",
          "  ██╔╝    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║        ",
          " ██╔╝     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║███████╗",
          " ╚═╝      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝╚══════╝",
          "====================================================================",
          "",
        },
        center = {
          { icon = " ",  icon_hl = "Title", desc = "Find a file",            desc_hl = "String", key = "Ctrl + Q",    key_hl = "Number", key_format = " %s", action = "Telescope find_files" },
          { icon = "󰈭 ", icon_hl = "Title", desc = "Search a word",          desc_hl = "String", key = "Ctrl + S",    key_hl = "Number", key_format = " %s", action = "Telescope live_grep" },
          { icon = " ",  icon_hl = "Title", desc = "Browse all files",       desc_hl = "String", key = "Ctrl + F",    key_hl = "Number", key_format = " %s", action = "Neotree filesystem left" },
          { icon = " ",  icon_hl = "Title", desc = "Open LazyGit",           desc_hl = "String", key = "Ctrl + L",    key_hl = "Number", key_format = " %s", action = "LazyGit" },
          { icon = " ",  icon_hl = "Title", desc = "Show TODO list",         desc_hl = "String", key = "Space + T + D", key_hl = "Number", key_format = " %s", action = "TodoTelescope" },
          { icon = " ",  icon_hl = "Title", desc = "Keymap help",            desc_hl = "String", key = ":Khelp",      key_hl = "Number", key_format = " %s", action = "Khelp" },
        },
        footer = {
          "",
          "  " .. os.date("%A, %d %B %Y | %H:%M"),
          "",
          "Use `:Khelp` to see every keymap available.",
        },
      },
    })
  end,
}
