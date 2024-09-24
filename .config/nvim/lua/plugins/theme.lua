-- Neovim theme
return {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    config = function()
        require("monokai-pro").setup({
            transparent_background = true,
            background_clear = {
                "telescope",
                "float_win"
            }
        })
        vim.o.background = "dark"
        vim.cmd("colorscheme monokai-pro")
    end
}
