vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")


vim.diagnostic.enable(false)

vim.g.lazyvim_check_order = false
vim.opt.swapfile = false       -- Disable swap files
vim.opt.foldmethod = "manual"
vim.opt.number = false         -- Absolute line numbers
vim.opt.relativenumber = false -- Relative line numbers
vim.o.laststatus = 0
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80,120"
vim.opt.showmode = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- Force these settings to stay off every time a file is opened
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*",
	callback = function()
		vim.opt.statuscolumn = ""
		vim.opt.foldcolumn = "0"
		vim.opt.signcolumn = "no" -- Change to "yes" if you want LSP icons back
		vim.opt.wrap = false -- Ensures 'nowrap' is always true
		vim.o.cmdheight = 0
		vim.opt.shortmess:append("Cc") -- Hide redundant messages
	end,
})


vim.opt.clipboard = "unnamedplus"




vim.api.nvim_create_autocmd("InsertCharPre", {
	callback = function()
		local char = vim.v.char

		if char ~= ">" then
			return
		end

		local row, col = unpack(vim.api.nvim_win_get_cursor(0))
		local line = vim.api.nvim_get_current_line()

		local before = line:sub(1, col)
		local after = line:sub(col + 1)

		-- ✅ Case 1: React fragment <>
		if before:match("<$") then
			vim.schedule(function()
				vim.api.nvim_put({ "</>" }, "c", true, true)
				vim.api.nvim_win_set_cursor(0, { row, col + 1 })
			end)
			return
		end

		-- ✅ Case 2: Skip explicit self-closing like <Hello />
		if before:match("/%s*$") then
			return
		end

		-- Match opening tag
		local tag = before:match("<(%w+)[^>]*$")

		if not tag then
			return
		end

		-- Skip void HTML tags
		local self_closing = {
			br = true, img = true, input = true, hr = true, meta = true, link = true
		}

		if self_closing[tag] then
			return
		end

		-- Skip if closing already exists ahead
		if after:match("^%s*</" .. tag .. ">") then
			return
		end

		-- ✅ Insert closing tag
		vim.schedule(function()
			vim.api.nvim_put({ "</" .. tag .. ">" }, "c", true, true)
			vim.api.nvim_win_set_cursor(0, { row, col + 1 })
		end)
	end,
})
