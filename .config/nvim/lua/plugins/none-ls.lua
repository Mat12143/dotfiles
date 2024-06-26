-- Formatting tool
local formatters = {
    "stylua",
    "prettier",
    "isort",
    "black",
    "goimports",
}

return
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function ()
            require("mason").setup()
            require("mason-null-ls").setup({
                ensure_installed = formatters
            })
        end
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local agroup = vim.api.nvim_create_augroup("LspFormatting", {})

            local null_ls = require("null-ls")
            null_ls.setup({
                debug = true,
                sources = {
                    null_ls.builtins.formatting.stylua,
                    -- Prettier formatting
                    null_ls.builtins.formatting.prettier,
                    -- Python files formatting
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.black,
                    -- Go Imports
                    null_ls.builtins.formatting.goimports,
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = agroup , buffer = bufnr })
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
        end,
    }
