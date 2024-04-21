-- Neovim theme catppuccin
return {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    config = function()
        require("monokai-pro").setup({
            background_clear = { "float_win", "neotree", "telescope" }
        })
        vim.cmd.colorscheme("monokai-pro")
    end,
}
