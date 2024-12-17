-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.swapfile = false -- Disable swap files
vim.opt.foldmethod = "manual"
vim.opt.relativenumber = false
vim.opt.number = false
vim.opt.colorcolumn = "80"
-- Toggle colorcolumn with 'vv'
vim.keymap.set("n", "vv", function()
  if vim.opt.colorcolumn:get()[1] == nil then
    vim.opt.colorcolumn = "80"
    print("ColorColumn ON")
  else
    vim.opt.colorcolumn = ""
    print("ColorColumn OFF")
  end
end, { desc = "Toggle color column" })
