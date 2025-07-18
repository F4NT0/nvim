--[[
   _____            _               ____              _   
  / ____|          (_)             |  _ \            | |  
 | (___  _ __  _ __ _ _ __   __ _  | |_) | ___   ___ | |_ 
  \___ \| '_ \| '__| | '_ \ / _` | |  _ < / _ \ / _ \| __|
  ____) | |_) | |  | | | | | (_| | | |_) | (_) | (_) | |_ 
 |_____/| .__/|_|  |_|_| |_|\__, | |____/ \___/ \___/ \__|
        | |                  __/ |                        
        |_|                 |___/                         
]]

--- GITHUB:
--- - springboot-nvim: https://github.com/elmcgill/springboot-nvim
--- - nvim-lspconfig: https://github.com/neovim/nvim-lspconfig
--- - nvim-jdtls: https://github.com/mfussenegger/nvim-jdtls

--- DESCRIPTION:
--- `springboot-nvim` is a Neovim plugin designed to enhance the development experience
--- when working with Spring Boot applications. It provides utilities and commands
--- tailored for Java and Spring Boot projects.

--- DEPENDENCIES:
--- - `nvim-lspconfig`: Required to configure and manage LSP clients.
--- - `nvim-jdtls`: Java LSP integration for Neovim, essential for Spring Boot support.

--- USAGE:
--- This plugin integrates with `nvim-jdtls` to provide Spring Boot-specific features.
--- After installation, it can be initialized with a simple `.setup()` call.

return {
  "elmcgill/springboot-nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-jdtls",
  },
  config = function()
    -- Gain access to the springboot nvim plugin and its functions
    local springboot_nvim = require("springboot-nvim")

    -- Run the setup
    springboot_nvim.setup({})
  end,
}
