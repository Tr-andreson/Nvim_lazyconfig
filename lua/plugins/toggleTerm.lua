return {
  -- Add the plugin
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = vim.o.columns, -- Full width
        open_mapping = [[<leader>;]],
        direction = "float", -- Use floating window
        float_opts = {
          border = "curved",
        },
      })
    end,
  },
}

-- return {
--   {
--     "akinsho/toggleterm.nvim",
--     config = function()
--       require("toggleterm").setup({
--         size = vim.o.columns, -- Full width
--         direction = "float", -- Use floating window
--         float_opts = {
--           border = "curved",
--         },
--       })
--
--       local Terminal = require("toggleterm.terminal").Terminal
--
--       -- Reusable terminal instances
--       local normalTerm = Terminal:new({ hidden = true, direction = "float" })
--       local bunDevTerm = Terminal:new({ cmd = "bun run dev", hidden = true, direction = "float" })
--       local bunBuildTerm = Terminal:new({ cmd = "bun run build", hidden = true, direction = "float" })
--       local tscWatchTerm = Terminal:new({ cmd = "tsc --watch", hidden = true, direction = "float" })
--
--       -- Normal toggle term with <space>;
--       vim.keymap.set("n", "<leader>;", function()
--         normalTerm:toggle()
--       end)
--
--       -- Bun Dev with <space>;d
--       vim.keymap.set("n", "<leader>;d", function()
--         bunDevTerm:toggle()
--       end)
--
--       -- Bun Build with <space>;b
--       vim.keymap.set("n", "<leader>;b", function()
--         bunBuildTerm:toggle()
--       end)
--
--       -- TypeScript Watch with <space>;t
--       vim.keymap.set("n", "<leader>;t", function()
--         tscWatchTerm:toggle()
--       end)
--     end,
--   },
-- }
