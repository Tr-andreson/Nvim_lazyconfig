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
-- keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
-- keymap.set("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)

-- Tabs
keymap.set("n", "nm", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "nn", ":tabprev<Return>", opts)
keymap.set("n", "nw", ":tabclose<Return>", opts)

-- Split window colemac
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

keymap.set("n", "cc1", ":colorscheme monochrome<Return>", opts)
keymap.set("n", "cc2", ":colorscheme solarized-osaka<Return>", opts)
keymap.set("n", "cc3", ":colorscheme onedark_dark<Return>", opts)
keymap.set("n", "cc0", ":colorscheme quiet<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
-- keymap.set("n", "<C-S-h>", "<C-w><")
-- keymap.set("n", "<C-S-l>", "<C-w>>")
-- keymap.set("n", "<C-S-k>", "<C-w>+")
-- keymap.set("n", "<C-S-j>", "<C-w>-")
keymap.set("n", "<C-k>", "<C-w>+")
keymap.set("n", "<C-j>", "<C-w>-")
keymap.set("n", "<C-l>", "<C-w><") -- Ctrl + h
keymap.set("n", "<C-h>", "<C-w>>") -- Ctrl + l

-- -- Diagnostics
-- keymap.set("n", "<C-j>", function()
--   vim.diagnostic.goto_next()
-- end, opts)

--- typescript keymaps
keymap.set("n", "tam", ":TypescriptAddMissingImports<Return><C-w>")
keymap.set("n", "toi", ":TypescriptOrganizeImports<Return><C-w>")
keymap.set("n", "tru", ":TypescriptRemoveUnused<Return><C-w>")
keymap.set("n", "tfa", ":TypescriptFixAll<Return><C-w>")

keymap.set("n", "nm", ":tabedit<Return><C-w>w")
keymap.set("n", "nn", ":tabnext<Return><C-w>w")

-- keymap.set("n", "cp", ":new | r!cat package.json<CR>")
-- vim.keymap.set("n", "cp", function()
--   -- Create a scratch buffer
--   local buf = vim.api.nvim_create_buf(false, true)
--
--   -- Define floating window dimensions
--   local width = math.floor(vim.o.columns * 0.8)
--   local height = math.floor(vim.o.lines * 0.8)
--   local row = math.floor((vim.o.lines - height) / 2)
--   local col = math.floor((vim.o.columns - width) / 2)
--
--   -- Open the floating window
--   vim.api.nvim_open_win(buf, true, {
--     relative = "editor",
--     width = width,
--     height = height,
--     row = row,
--     col = col,
--     style = "minimal",
--     border = "rounded",
--   })
--
--   -- Read the package.json file content into the buffer
--   vim.fn.jobstart({ "cat", "package.json" }, {
--     stdout_buffered = true,
--     on_stdout = function(_, data)
--       if data then
--         vim.api.nvim_buf_set_lines(buf, 0, -1, false, data)
--       end
--     end,
--   })
-- end, { desc = "Open package.json in floating window" })

-- vim.keymap.set("n", "cp", function()
--   -- Create a scratch buffer
--   local buf = vim.api.nvim_create_buf(false, true)
--
--   -- Define floating window dimensions
--   local width = math.floor(vim.o.columns * 0.8)
--   local height = math.floor(vim.o.lines * 0.8)
--   local row = math.floor((vim.o.lines - height) / 2)
--   local col = math.floor((vim.o.columns - width) / 2)
--
--   -- Open the floating window
--   vim.api.nvim_open_win(buf, true, {
--     relative = "editor",
--     width = width,
--     height = height,
--     row = row,
--     col = col,
--     style = "minimal",
--     border = "rounded",
--   })
--
--   local output = {}
--
--   -- First job: get node_modules size first
--   vim.fn.jobstart({ "du", "-sh", "node_modules" }, {
--     stdout_buffered = true,
--     on_stdout = function(_, size_data)
--       if size_data then
--         vim.list_extend(output, { "=== node_modules size ===" })
--         vim.list_extend(output, size_data)
--         vim.list_extend(output, { "", "=== package.json ===" })
--       end
--     end,
--     on_exit = function()
--       -- Then load package.json
--       vim.fn.jobstart({ "cat", "package.json" }, {
--         stdout_buffered = true,
--         on_stdout = function(_, data)
--           if data then
--             vim.list_extend(output, data)
--           end
--           -- Set all combined lines to buffer
--           vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
--           vim.api.nvim_buf_set_option(buf, "filetype", "json")
--
--           -- Highlight node_modules section in yellow
--           vim.api.nvim_buf_add_highlight(buf, -1, "WarningMsg", 0, 0, -1)
--           vim.api.nvim_buf_add_highlight(buf, -1, "WarningMsg", 1, 0, -1)
--         end,
--       })
--     end,
--   })
--
-- Optional: close on "q"
--   vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>bd!<CR>", { noremap = true, silent = true })
-- end, { desc = "Show node_modules size + package.json in floating window" })

-- vim.keymap.set("n", "cp", ":tabnew package.json<CR>")

keymap.set("n", "<leader>t", ":TailwindFoldToggle<Return>")

vim.keymap.set("n", "cl", function()
  local var = vim.fn.expand("<cword>")
  vim.api.nvim_feedkeys(
    "o"
      .. "console.log("
      .. var
      .. ', "'
      .. var
      .. ' debug");'
      .. vim.api.nvim_replace_termcodes("<Esc>", true, true, true),
    "n",
    true
  )
end, { desc = "Add console.log with debug label for variable under cursor" })

vim.keymap.set("n", "cd", function()
  vim.api.nvim_feedkeys("o" .. "debugger;" .. vim.api.nvim_replace_termcodes("<Esc>", true, true, true), "n", true)
end, { desc = "Insert debugger statement below" })

vim.keymap.set("n", "cL", function()
  local var = vim.fn.expand("<cword>")
  vim.api.nvim_feedkeys(
    "o"
      .. "console.log("
      .. var
      .. ', "'
      .. var
      .. ' debug");'
      .. "\n"
      .. "debugger;"
      .. vim.api.nvim_replace_termcodes("<Esc>", true, true, true),
    "n",
    true
  )
end, { desc = "Add console.log and debugger statement below" })
