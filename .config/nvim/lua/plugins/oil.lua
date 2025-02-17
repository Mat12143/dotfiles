return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
			},
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["<C-p>"] = "",
			},
		})
	end,
}
