return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		require("null-ls").setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,
				-- JS & TS
				null_ls.builtins.formatting.prettier,
				-- Golang
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.gofmt,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
