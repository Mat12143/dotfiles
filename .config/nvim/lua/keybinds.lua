-- Oil Nvim
vim.keymap.set("n", "-", function()
    vim.cmd("Oil")
end, { desc = "Open Parent Directory" })

-- Telescope
local bultin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", bultin.find_files, { desc = "Open Telescope Fuzzy Finder", remap = true })
-- vim.keymap.set("n", "<leader>fg", bultin.live_grep)

-- Lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Open the LSP Hover Menu" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to function definition" })
vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "Open LSP Code Actions" })

-- None-ls
-- vim.keymap.set("n", "<leader>f", function()
-- 	vim.lsp.buf.format({ async = false })
-- end, { desc = "Format the current buffer" })
