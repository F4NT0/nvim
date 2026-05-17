--[[ ============================================================================
PLUGIN: OXY2DEV/markview.nvim
============================================================================
Inline preview of markdown documents: headings, lists, callouts, tables,
code blocks and links are rendered with syntax highlighting and icons.

Commands:
  :Markview            toggle the preview
  :Markview enable     turn rendering on
  :Markview disable    turn rendering off
  :Markview hybridMode toggle hybrid (raw + rendered) mode

Repo: https://github.com/OXY2DEV/markview.nvim
Docs: Documentations/markdown/markview.md
============================================================================ ]]

return {
  "OXY2DEV/markview.nvim",
  ft       = { "markdown", "mdx" },
  priority = 49,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    preview = {
      filetypes  = { "markdown", "mdx" },
      ignore_buftypes = { "nofile" },
      icon_provider = "devicons",
    },
  },
}
