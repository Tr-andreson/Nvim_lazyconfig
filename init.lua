-- boosetxkbmap us -variant colemak_dhstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")


vim.diagnostic.enable(false)

vim.g.lazyvim_check_order = false
vim.opt.swapfile = false -- Disable swap files
vim.opt.foldmethod = "manual"
vim.opt.number = false -- Absolute line numbers
vim.opt.relativenumber = false -- Relative line numbers
vim.o.laststatus = 0
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80,120"
vim.opt.showmode = false



