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
