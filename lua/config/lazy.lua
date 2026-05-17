--[[ ============================================================================
LAZY.NVIM BOOTSTRAP
============================================================================
Bootstraps the lazy.nvim plugin manager and loads every plugin spec under
`lua/plugins/`. Performance defaults are turned on so cold starts stay fast.
============================================================================ ]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy    = false,      -- plugins opt-in to lazy loading themselves
    version = false,      -- always use the latest commit on the configured branch
  },
  install = { colorscheme = { "catppuccin", "habamax" } },
  checker = { enabled = false },              -- no automatic update checks at startup
  change_detection = { notify = false },
  performance = {
    cache = { enabled = true },
    rtp = {
      disabled_plugins = {
        "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin",
        "netrwPlugin", "matchit", "matchparen", "spellfile",
      },
    },
  },
  ui = {
    border = "rounded",
  },
})
