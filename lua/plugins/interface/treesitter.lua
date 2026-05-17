--[[ ============================================================================
PLUGIN: nvim-treesitter/nvim-treesitter
============================================================================
Syntax highlighting and indentation engine based on incremental parsing.
Parsers are installed automatically on first open of a supported filetype.

Requires a C compiler (gcc/clang) and `tree-sitter-cli` on PATH for
out-of-the-box parser installation.

Repo: https://github.com/nvim-treesitter/nvim-treesitter
Docs: Documentations/interface/treesitter.md
============================================================================ ]]

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  cmd   = { "TSUpdate", "TSInstall", "TSInstallInfo", "TSUpdateSync" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc", "query",
        "c_sharp", "java", "go", "rust", "python",
        "powershell", "bash",
        "toml", "yaml", "json", "json5",
        "xml", "html", "css", "scss",
        "javascript", "typescript", "tsx",
        "sql", "dockerfile", "gitignore", "gitcommit",
        "markdown", "markdown_inline",
        "regex", "diff",
      },
      sync_install = false,
      auto_install = true,
      highlight    = { enable = true, additional_vim_regex_highlighting = false },
      indent       = { enable = true },
      incremental_selection = {
        enable  = true,
        keymaps = {
          init_selection    = "<C-Space>",
          node_incremental  = "<C-Space>",
          scope_incremental = false,
          node_decremental  = "<bs>",
        },
      },
    })
  end,
}
