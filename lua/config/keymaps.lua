local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<space>w", ":update<Return>", opts)
keymap.set("n", "<space>q", ":quit<Return>", opts)
keymap.set("n", "<space>Q", ":qa<Return>", opts)


-- Tabs
keymap.set("n", "nm", ":tabedit<Return>")
keymap.set("n", "<space>l", ":Lazy<Return>")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set({ "n", "t" }, "nn", ":tabprev<Return>", opts)
keymap.set({ "n", "t" }, "nw", ":tabclose<Return>", opts)

-- Split window colemac
vim.keymap.set("n", "ss", ":split<CR><C-w>w", opts)
vim.keymap.set("n", "sv", ":vsplit<CR><C-w>w", opts)


-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

keymap.set("n", "<C-k>", "<C-w>+")
keymap.set("n", "<C-j>", "<C-w>-")
keymap.set("n", "<C-l>", "<C-w><") -- Ctrl + h
keymap.set("n", "<C-h>", "<C-w>>") -- Ctrl + l





vim.opt.timeoutlen = 300
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
