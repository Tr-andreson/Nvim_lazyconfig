return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        start_in_insert = true,
        persist_size = false, -- faster
        close_on_exit = true,
        shade_terminals = false, -- no dimming = cleaner & faster
        direction = "float",

        float_opts = {
          border = "single", -- thin minimal border
          winblend = 0,
        },
      })

      local Terminal = require("toggleterm.terminal").Terminal

      -- ⚡ Right side terminal (main)
      local side = Terminal:new({
        hidden = true,
        direction = "float",
        float_opts = {
          border = "single",
          width = function()
            return math.floor(vim.o.columns * 0.4)
          end,
          height = function()
            return vim.o.lines
          end,
          row = 0,
          col = function()
            return vim.o.columns - math.floor(vim.o.columns * 0.4)
          end,
        },
      })

      -- ⚡ Bottom terminal (secondary)
      local bottom = Terminal:new({
        hidden = true,
        direction = "float",
        float_opts = {
          border = "single",
          width = vim.o.columns,
          height = function()
            return math.floor(vim.o.lines * 0.25)
          end,
          row = function()
            return vim.o.lines - math.floor(vim.o.lines * 0.25)
          end,
          col = 0,
        },
      })

      -- 🚀 Keymaps (instant toggle, no overhead)
      vim.keymap.set({ "n", "t" }, "<leader>;", function()
        side:toggle()
      end, { desc = "Side Terminal" })

      vim.keymap.set({ "n", "t" }, "<leader>o", function()
        bottom:toggle()
      end, { desc = "Bottom Terminal" })

      -- ⚡ Fast escape
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })

      -- ⚡ Navigation
      vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
      vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
      vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
      vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])

      -- 🎨 Minimal thin grey border (matches your screenshot)
      vim.api.nvim_set_hl(0, "FloatBorder", {
        fg = "#2a2a2a", -- subtle grey
        bg = "none",
      })

      vim.api.nvim_set_hl(0, "NormalFloat", {
        bg = "none",
      })
    end,
  },
}
