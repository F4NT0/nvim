<p align="center">
  <img src="https://github.com/F4NT0/nvim-images/blob/7d74d883d35f13207f27b4c4c2a1ac6c7a8fe7eb/neovim_logo.png">
</p>

---

🡢 This is my personal Neovim configuration with a set of plugins to enhance the development experience.

🡢 This Project is for **WINDOWS 11** only, all configurations are made into this Operational System.

🡢 To know the available keymaps use the command `:Khelp` into the command mode!

## Directory Organization

<p align="center">
  <img src="https://github.com/F4NT0/nvim-images/blob/47b385e7e4f3787603692fbe9baa98a773785926/Directory-org.png" width="800px">
</p>

| File name | Description
|---|---|
|`init.lua`|The main entry point for the Neovim configuration.
|`lua/`|Contains all the Lua configuration files.
|`plugins.lua`|Loads all the plugins from the `lua/plugins` directory.
|`config/`|Contains the configuration files for the plugins.
|`autocmds.lua`|  Contains the autocommands.
|`jdtls.lua`| Contains the configuration for the Java LSP.
|`keymaps.lua`|Contains all the keymaps.
|`plugins/`|Contains the plugin specifications.
|`init.lua`|  Loads all the plugins from the `lua/plugins` directory.
|`git-manager/`| Contains the git manager plugins.
|`interface/`|Contains the interface plugins.
|`lsp/`| Contains the LSP plugins.
|`markdown/`| Contains the markdown plugins.
|`programming/`| Contains the programming plugins.

## Installation

1. To use this configuration, you need to have Neovim installed on your Windows 11 machine.
2. The location of the files need to be in `C:\Users\user\Appdata\Local\nvim`.
3. Need to install `gcc` using scoop: `scoop install gcc`.
4. Nedd to install `python` using scoop: `scoop install python`.
5. Need to install `java` JDK.

## Plugins

- [catppuccin/nvim](https://github.com/catppuccin/nvim) -  A collection of themes for Neovim.
- [nvimdev/dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) - A dashboard that appears when starting Neovim without a specific file.
- [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) - A plugin to integrate Lazygit into Neovim.
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A status bar to style the Neovim taskbar.
- [OXY2DEV/markview.nvim](https://github.com/OXY2DEV/markview.nvim) - A markdown previewer for Neovim.
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - An LSP manager to install language configurations.
- [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - A file explorer tree.
- [folke/noice.nvim](https://github.com/folke/noice.nvim) - A plugin that replaces the UI for messages, cmdline and popupmenu.
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable fuzzy finder.
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - A plugin to manage terminals inside Neovim.
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - A plugin for code highlighting and indentation.
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine for Neovim.
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) - A plugin to comment code.
- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) - A debug adapter protocol implementation for Neovim.
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for the Neovim LSP client.
- [mfussenegger/nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) - An extension for nvim-lspconfig to configure jdtls.
- [nvim-java/springboot-nvim](https://github.com/nvim-java/springboot-nvim) - A plugin to help with Spring Boot development.
- [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim) - A tabline plugin for Neovim.
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) - A plugin to surround text with pairs of characters.
