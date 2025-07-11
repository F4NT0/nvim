return {
	"elmcgill/springboot-nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussengger/nvim-jdtls",
	},
	config = function()
		-- Gain access to the springboot nvim plugin and its functions
		local springboot_nvim = require("springboot-nvim")

		-- Shift + J + R = Run the Spring Boot
		vim.keymap.set("n", "Jr", springboot_nvim.boot_run, { desc = "[J]ava [R]un Spring Boot" })

		-- Shift + J + c = Open a Generate class UI to create a class
		vim.keymap.set("n", "Jc", springboot_nvim.generate_class, { desc = "[J]ava Create [C]lass" })

		-- Shift + J + i = Generate an Interface
		vim.keymap.set("n", "Ji", springboot_nvim.generate_interface, { desc = "[J]ava Create [I]nterface" })

		-- Shift + J + e = Generate an Enum
		vim.keymap.set("n", "Je", springboot_nvim.generate_enum, { desc = "[J]ava Create [E]num" })

		-- Run the setup
		springboot_nvim.setup({})
	end,
}
