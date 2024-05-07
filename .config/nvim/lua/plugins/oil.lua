return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({

            view_options = {
                show_hidden = true
            }

        })
        vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open OIL Tree" })
        vim.keymap.set("n", "<leader>E", "<CMD>Oil Close<CR>", { desc = "Close OIL Tree" })
    end,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
