return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
        require("silicon").setup({
            font = "JetBrainsMono Nerd Font=34",
            theme = "Gruvbox",
            no_rounded_corners = false,
            output = function()
                return "~/Pictures/Code/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png";
            end
        })
    end,
}
