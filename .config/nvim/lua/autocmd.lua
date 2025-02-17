-- Enable Zen Mode on BufEnter
vim.api.nvim_create_autocmd({ "VimEnter", "BufReadPost" }, {
	callback = require("zen-mode").open,
})
