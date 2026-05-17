--[[ ============================================================================
PLUGIN: NvChad/nvim-colorizer.lua
============================================================================
Renders colour codes (#RRGGBB, rgb(), css names…) with their actual colour
as background or foreground. Useful when editing themes or CSS.

Repo: https://github.com/NvChad/nvim-colorizer.lua
Docs: Documentations/interface/colorizer.md
============================================================================ ]]

return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      filetypes = { "*" },
      user_default_options = {
        RGB    = true,
        RRGGBB = true,
        names  = true,
        css    = true,
        css_fn = true,
        mode   = "background",
      },
    })
  end,
}
