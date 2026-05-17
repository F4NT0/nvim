--[[ ============================================================================
PLUGIN GROUP LOADER
============================================================================
Lazy.nvim follows the `import` keys below recursively, which loads every
plugin spec under each sub-directory. Adding a new category only requires
creating the folder and adding an entry here.
============================================================================ ]]

return {
  { import = "plugins.interface"   },
  { import = "plugins.lsp"         },
  { import = "plugins.markdown"    },
  { import = "plugins.programming" },
  { import = "plugins.git-manager" },
}
