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
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            -- Loop over all the lsp servers to call setup()
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities
                }
            end

            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
