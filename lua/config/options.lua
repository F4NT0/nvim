--[[ ============================================================================
EDITOR OPTIONS
============================================================================
Pure-vim options. No plugins are required to be loaded for any of this to
work. Anything that does not need to wait can live here.
============================================================================ ]]

local opt = vim.opt
local g   = vim.g

-- ── Indentation ───────────────────────────────────────────────────────────────
opt.expandtab    = true   -- convert tabs to spaces
opt.tabstop      = 2      -- visual width of a tab
opt.softtabstop  = 2      -- spaces inserted when pressing <Tab>
opt.shiftwidth   = 2      -- spaces used for auto-indent
opt.autoindent   = true   -- copy indent from current line on <CR>
opt.smartindent  = true   -- language-aware indent for new lines

-- ── UI ────────────────────────────────────────────────────────────────────────
opt.number         = true               -- show absolute line numbers
opt.relativenumber = false              -- set to true if you want hybrid numbers
opt.cursorline     = true               -- highlight current line
opt.signcolumn     = "yes"              -- always render the sign column (no jitter)
opt.termguicolors  = true               -- 24-bit colours
opt.showmode       = false              -- mode is shown by lualine
opt.cmdheight      = 1
opt.pumheight      = 12                 -- max items in the completion popup
opt.scrolloff      = 8                  -- keep N lines around the cursor
opt.sidescrolloff  = 8
opt.splitright     = true
opt.splitbelow     = true
opt.wrap           = false
opt.fillchars      = { eob = " " }      -- hide ~ on empty lines

-- ── Behaviour ─────────────────────────────────────────────────────────────────
opt.mouse        = "a"                  -- enable mouse in all modes
opt.clipboard    = "unnamedplus"        -- share clipboard with the OS
opt.undofile     = true                 -- persistent undo
opt.swapfile     = false
opt.backup       = false
opt.updatetime   = 250                  -- faster CursorHold / diagnostics
opt.timeoutlen   = 400                  -- faster which-key style sequences
opt.ignorecase   = true
opt.smartcase    = true
opt.completeopt  = { "menu", "menuone", "noselect" }
opt.shortmess:append("c")               -- silence completion messages

-- ── Filetype mappings ─────────────────────────────────────────────────────────
vim.filetype.add({
  extension = {
    mdx   = "markdown",
    axaml = "xml",
  },
})

-- ── Syntax ────────────────────────────────────────────────────────────────────
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- ── Disable unused built-in providers (faster startup) ────────────────────────
g.loaded_perl_provider   = 0
g.loaded_ruby_provider   = 0
g.loaded_python3_provider = 0
g.loaded_node_provider   = 0

-- ── Disable unused built-in plugins ───────────────────────────────────────────
local disabled_built_ins = {
  "gzip", "tar", "tarPlugin", "zip", "zipPlugin",
  "getscript", "getscriptPlugin",
  "vimball", "vimballPlugin",
  "2html_plugin",
  "matchit", "matchparen",
  "logiPat", "rrhelper",
  "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers",
  "tutor", "rplugin", "spellfile_plugin",
}
for _, plugin in ipairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end
