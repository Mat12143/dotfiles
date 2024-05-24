-- Formatting tool
return {
    "nvimtools/none-ls.nvim",
    config = function()
        vim.api.nvim_create_augroup("LspFormatting", {})
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                -- Prettier formatting
                null_ls.builtins.formatting.prettier,
                -- Python files formatting
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.black,
                -- Go Imports
                null_ls.builtins.formatting.goimports
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end
            end,
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
