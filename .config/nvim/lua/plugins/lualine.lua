return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                component_separators = "|",
                section_separators = { left = "", right = "" },
                theme = "auto",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "filename" },
                lualine_c = { "" },
                lualine_x = { "" },
                lualine_y = { "diagnostics" },
                lualine_z = { "branch" },
            },
        })
    end,
}
