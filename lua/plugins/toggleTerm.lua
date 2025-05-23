return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 80 -- Increased height for horizontal terminal
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        start_in_insert = true,
        persist_size = true,
        close_on_exit = true,
        shell = vim.o.shell,
      })

      local Terminal = require("toggleterm.terminal").Terminal
      local horiz = Terminal:new({ direction = "horizontal" })
      local vert = Terminal:new({ direction = "vertical" })
      local float = Terminal:new({ direction = "float" })
      local tab = Terminal:new({ direction = "tab" })

      vim.keymap.set({ "n", "t" }, "<leader>t", function()
        horiz:toggle()
      end, { desc = "Toggle Horizontal Terminal" })

      vim.keymap.set({ "n", "t" }, "<leader>f", function()
        float:toggle()
      end, { desc = "Toggle Floating Terminal" })

      vim.keymap.set({ "n", "t" }, "<leader>;", function()
        vert:toggle()
      end, { desc = "Toggle Floating Terminal" })

      -- Terminal navigation keybindings
      vim.cmd([[
        tnoremap <C-S-h> <C-\><C-n><C-w>h
        tnoremap <C-S-j> <C-\><C-n><C-w>j
        tnoremap <C-S-k> <C-\><C-n><C-w>k
        tnoremap <C-S-l> <C-\><C-n><C-w>l
      ]])

      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    end,
  },
}
