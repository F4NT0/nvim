--[[ ============================================================================
PLUGIN: nvim-tree/nvim-web-devicons
============================================================================
Filetype icons used by Neo-tree, Telescope, lualine, barbar, dashboard…
Requires a Nerd Font (JetBrainsMono NF / FiraCode NF recommended).

Repo: https://github.com/nvim-tree/nvim-web-devicons
Docs: Documentations/interface/devicons.md
============================================================================ ]]

return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  config = function()
    require("nvim-web-devicons").set_icon({
      cs    = { icon = "",  color = "#ad8dd7", name = "Csharp" },
      csx   = { icon = "",  color = "#ad8dd7", name = "Csharp" },
      java  = { icon = "",  color = "#f59419", name = "Java"   },
      ps1   = { icon = "",  color = "#13CFEC", name = "Powershell" },
      py    = { icon = "",  color = "#0690F3", name = "Python" },
      go    = { icon = "󰵻", color = "#4C7AE4", name = "Go"     },
      axaml = { icon = "󰗀", color = "#ffff00", name = "Axaml"  },
    })
  end,
}
