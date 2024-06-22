-- Set tab spaces
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.o.signcolumn = "yes"

-- Enable line number
vim.o.number = true
vim.o.relativenumber = true

-- Use the system clipboard
vim.o.clipboard = "unnamedplus"

-- Set the vim leader key
vim.g.mapleader = " "

-- Use the true colors
vim.opt.termguicolors = true

-- Set lualine to use all the width
vim.o.laststatus = 3
