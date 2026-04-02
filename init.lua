vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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




vim.api.nvim_create_autocmd("InsertCharPre", {
  pattern = { "*.html", "*.jsx", "*.tsx" },
  callback = function()
    local char = vim.v.char

    -- Trigger only when typing ">"
    if char ~= ">" then
      return
    end

    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]

    -- Get text before cursor
    local before = line:sub(1, col)

    -- Match last opening tag
    local tag = before:match("<(%w+)[^>]*$")

    if tag then
      -- Avoid self-closing tags
      local self_closing = {
        br = true, img = true, input = true, hr = true, meta = true, link = true
      }

      if self_closing[tag] then
        return
      end

      -- Insert closing tag
      vim.schedule(function()
        vim.api.nvim_put({ "</" .. tag .. ">" }, "c", true, true)
        vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), col + 1 })
      end)
    end
  end,
})

