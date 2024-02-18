-- Set tab spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Enable line number
vim.cmd("set number")

-- Use the system clipboard
vim.cmd("set clipboard+=unnamedplus")

-- Set the vim leader key
vim.g.mapleader = " "

-- Use the true colors
vim.opt.termguicolors = true

-- Set lualine to use all the width
vim.o.laststatus = 3
