-- bootsetxkbmap us -variant colemak_dhstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.swapfile = false -- Disable swap files

vim.opt.foldmethod = "manual"
vim.opt.number = false -- Absolute line numbers
vim.opt.relativenumber = false -- Relative line numbers
vim.o.laststatus = 0
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80,120"
-- Scroll 3 lines down/up
-- vim.keymap.set("n", "<C-d>", "5<C-e>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-u>", "5<C-y>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "5j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "5k", { noremap = true, silent = true })

-- Toggle colorcolumn with 'vv'
-- NOTE: this functin is used for making color column
vim.keymap.set("n", "vv", function()
  if vim.opt.colorcolumn:get()[1] == nil then
    vim.opt.colorcolumn = "80,120"
    print("ColorColumn ON: 80, 120")
  else
    vim.opt.colorcolumn = ""
    print("ColorColumn OFF")
  end
end, { desc = "Toggle color column" })

vim.opt.timeoutlen = 300
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
