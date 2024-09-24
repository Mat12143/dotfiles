-- Auto complete and snippets
return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            -- Add ( after function
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/cpp.json" } })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        local luasnip = require("luasnip")
                        if not luasnip then
                            return
                        end
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                    border = "rounded",
                },
                completion = {
                    border = "rounded",
                },
                mapping = {
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        local has_words_before = function()
                            unpack = unpack or table.unpack
                            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                            return col ~= 0
                                and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
                                == nil
                        end

                        local luasnip = require("luasnip")

                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                sources = cmp.config.sources({
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
