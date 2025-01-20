-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- File explorer with NvimTree
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)

-- Tabs
keymap.set("n", "nm", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "nn", ":tabprev<Return>", opts)
keymap.set("n", "nw", ":tabclose<Return>", opts)

-- Split window colemac
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

keymap.set("n", "cc1", ":colorscheme monochrome<Return>", opts)
keymap.set("n", "cc2", ":colorscheme solarized-osaka-moon<Return>", opts)
keymap.set("n", "cc3", ":colorscheme onedark_dark<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
-- keymap.set("n", "<C-S-h>", "<C-w><")
-- keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")
keymap.set("n", "<C-h>", "<C-w><") -- Ctrl + h
keymap.set("n", "<C-l>", "<C-w>>") -- Ctrl + l

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

--- typescript keymaps
keymap.set("n", "tam", ":TypescriptAddMissingImports<Return><C-w>")
keymap.set("n", "toi", ":TypescriptOrganizeImports<Return><C-w>")
keymap.set("n", "tru", ":TypescriptRemoveUnused<Return><C-w>")
keymap.set("n", "tfa", ":TypescriptFixAll<Return><C-w>")

keymap.set("n", "nm", ":tabedit<Return><C-w>w")
keymap.set("n", "nn", ":tabnext<Return><C-w>w")

keymap.set("n", "cp", ":! cat package.json<Return><C-w>")
keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)

keymap.set("n", "<leader>tf", function()
  vim.cmd("term")
  vim.cmd("only")
end, { desc = "Open full-screen terminal" })
-- keymap.set({ "v" }, "<Leader>re", require("react-extract").extract_to_new_file)
keymap.set({ "v" }, "<Leader>rc", require("react-extract").extract_to_current_file)
