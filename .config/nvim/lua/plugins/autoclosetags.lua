-- Autoclose () {} when writing
return {
	"m4xshen/autoclose.nvim",
	config = function()
		require("autoclose").setup({
			close = true,
		})
	end,
}
