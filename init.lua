vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- boosetxkbmap us -variant colemak_dhstrap lazy.nvim, LazyVim and your plugins
--
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
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- Force these settings to stay off every time a file is opened
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt.statuscolumn = ""
    vim.opt.foldcolumn = "0"
    vim.opt.signcolumn = "no" -- Change to "yes" if you want LSP icons back
	vim.opt.wrap = false       -- Ensures 'nowrap' is always true
  end,
})

vim.opt.clipboard = "unnamedplus"




