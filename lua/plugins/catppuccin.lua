return {
   "catppuccin/nvim",
   lazy = false,
   name = "catppuccin",
   priority = 1000,
   config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      background = { dark = "mocha" },
      color_overrides = { mocha = { base = "#0d1117" } },
      no_italic = true,
      no_bold = true
    })
    vim.cmd.colorscheme "catppuccin"
   end
}
