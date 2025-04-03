return { 
  -- Instalation
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",

  -- Configuration
  config = function()
    local tree = require("nvim-treesitter.configs")
    tree.setup({
      ensure_installed = {"lua", "c_sharp", "java", "powershell", "toml", "sql", "json", "yaml", "xml"},
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
 
