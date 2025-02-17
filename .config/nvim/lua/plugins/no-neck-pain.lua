return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {
        autocmds = {
            enableOnVimEnter = true,
            skipEnteringNoNeckPainBuffer = true,
        },
        width = 120,
        buffers = {
            right = {
                scratchPad = {
                    enable = true,
                },
            },
            left = {
                scratchPad = {
                    enable = true,
                },
            },
        },
    },
    config = function(_, opts)
        require("no-neck-pain").setup(opts)
    end,
}
