-- Syntax highlighting
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"python",
				"markdown",
				"sql",
				"xml",
				"go",
				"php",
				"html",
				"prisma",
				"java",
				"rust",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
