return {
  "nvim-tree/nvim-web-devicons",
      config = function()
      require("nvim-web-devicons").set_icon {
        cs = {
          icon = "",
          color = "#ad8dd7",
          name = "Csharp"
        },
        java = {
          icon = "",
          color = "#f59419",
          name = "Java"
        },
        ps1 = {
          icon = "",
          color = "#13CFEC",
          name = "Powershell"
        },
        py = {
          icon = "",
          color = "#0690F3",
          name = "Python"
        },
        go = {
          icon = "󰵻",
          color = "#4C7AE4",
          name = "Go"
        },
      }
    end
}
