--[[ ============================================================================
NEOVIM ENTRY POINT
============================================================================
This is the main entry point of the configuration. It is intentionally tiny:
all heavy lifting is delegated to small modules under `lua/config/`.

Load order matters:
  1. options        -> editor settings (loaded first, sync, no plugins)
  2. lazy           -> plugin manager bootstrap (loads plugin specs)
  3. keymaps        -> global keymaps that don't depend on a specific plugin
  4. autocmds       -> autocommands (filetypes, highlights, perf)

Performance notes:
  - vim.loader.enable() turns on the byte-code module cache (Neovim 0.9+).
  - Unused providers are disabled (perl, ruby, python3, node) so Neovim does
    not waste time probing for them at startup.
  - Most plugins are loaded lazily (event/cmd/ft/keys) inside their spec files.
============================================================================ ]]

-- Enable the Lua module cache (huge startup win on Neovim 0.9+).
if vim.loader and vim.loader.enable then
  vim.loader.enable()
end

-- Leader keys must be set before any plugin spec is loaded.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load configuration modules.
require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
