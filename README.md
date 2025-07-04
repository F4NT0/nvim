
# Neovim Configuration

This is a personal Neovim configuration with a set of plugins to enhance the development experience.

## Plugins

| Plugin | Description | GitHub URL |
|---|---|---|
| Catppuccin | A collection of themes for Neovim. | https://github.com/catppuccin/catppuccin |
| Dashboard-nvim | A dashboard that appears when starting Neovim without a specific file. | https://github.com/nvimdev/dashboard-nvim |
| Lazygit.nvim | A plugin to integrate Lazygit into Neovim. | https://github.com/kdheepak/lazygit.nvim |
| Lualine.nvim | A status bar to style the Neovim taskbar. | https://github.com/nvim-lualine/lualine.nvim |
| Mason.nvim | An LSP manager to install language configurations. | https://github.com/williamboman/mason.nvim |
| Mason-lspconfig.nvim | An extension for Mason to bridge mason.nvim with the lspconfig plugin. | https://github.com/williamboman/mason-lspconfig.nvim |
| Neo-tree.nvim | A file explorer tree. | https://github.com/nvim-neo-tree/neo-tree.nvim |
| Nvim-lspconfig | A configuration manager for the built-in LSP client. | https://github.com/neovim/nvim-lspconfig |
| Telescope.nvim | A highly extendable fuzzy finder. | https://github.com/nvim-telescope/telescope.nvim |
| Toggleterm.nvim | A plugin to manage terminals inside Neovim. | https://github.com/akinsho/toggleterm.nvim |
| Nvim-treesitter | A plugin for code highlighting and indentation. | https://github.com/nvim-treesitter/nvim-treesitter |

## Commands

| Keybinding | Action | Plugin |
|---|---|---|
| `lg` | Open Lazy Git | Lazygit.nvim |
| `<C-k>` | Show information about the function (hover) | Nvim-lspconfig |
| `gd` | Go to definition | Nvim-lspconfig |
| `ca` | Code action | Nvim-lspconfig |
| `<C-f>` | Show files and folders on the left side | Neo-tree.nvim |
| `<C-b>` | Show Git status in a floating window | Neo-tree.nvim |
| `<C-p>` | Find files | Telescope.nvim |
| `<C-s>` | Search for a word in the code | Telescope.nvim |
| `<C-t>` | Open/Close terminal | Toggleterm.nvim |
| `<C-g>` | Open/Close Gemini terminal | Toggleterm.nvim |
