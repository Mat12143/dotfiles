-- File explorer
return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        })
        vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal float<CR>", {})
        vim.keymap.set("n", "<leader>E", ":Neotree filesystem close<CR>", {})
    end,
}
