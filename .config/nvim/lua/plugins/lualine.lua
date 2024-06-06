-- Status bar customization
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                component_separators = "|",
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = { "neo-tree" },
                },
                theme = "monokai-pro",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "filename" },
                lualine_x = { "diagnostics" },
                lualine_y = { "filetype" },
                lualine_z = { "" },
            },
        })
    end,
}
