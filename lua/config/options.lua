-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.diagnostic.enable(false)

vim.opt.swapfile = false -- Disable swap files
vim.opt.foldmethod = "manual"
vim.opt.number = false -- Absolute line numbers
vim.opt.relativenumber = false -- Relative line numbers
vim.o.laststatus = 0
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80,120"
