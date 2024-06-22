-- Language server

local servers = {
    "lua_ls",
    "html",
    "pyright",
    "tsserver",
    "jsonls",
    "svelte",
    "cssls",
    "tailwindcss",
    "dockerls",
    "gopls",
    "docker_compose_language_service",
    "yamlls",
    "html",
}

return {
    {
        "folke/neodev.nvim"
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = servers
            })
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities
                    })
                end,
                ["lua_ls"] = function()
                    require("neodev").setup()
                    require("lspconfig")["lua_ls"].setup({
                        capabilities = capabilities,
                        Lua = {
                            telemetry = { enable = false }
                        }

                    })
                end
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
