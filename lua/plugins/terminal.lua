return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        start_in_insert = true,
        persist_size = false,
        close_on_exit = true,
        shade_terminals = false,
        direction = "float",

        float_opts = {
          border = "single",
          winblend = 0,
        },
      })

      local Terminal = require("toggleterm.terminal").Terminal

      -- ⚡ Right terminal (80% width)
      local right = Terminal:new({
        hidden = true,
        direction = "float",
        float_opts = {
          border = "single",
          width = function()
            return math.floor(vim.o.columns * 0.5)
          end,
          height = function()
            return vim.o.lines
          end,
          row = 0,
          col = function()
            return vim.o.columns - math.floor(vim.o.columns * 0.5)
          end,
        },
      })

      -- ⚡ Left terminal (80% width)
      local left = Terminal:new({
        hidden = true,
        direction = "float",
        float_opts = {
          border = "single",
          width = function()
            return math.floor(vim.o.columns * 0.6)
          end,
          height = function()
            return vim.o.lines
          end,
          row = 0,
          col = 0,
        },
      })

      -- ⚡ Bottom terminal (FULL width, 25% height)
      local bottom = Terminal:new({
        hidden = true,
        direction = "float",
        float_opts = {
          border = "single",
          width = function()
            return vim.o.columns
          end,
          height = function()
            return math.floor(vim.o.lines * 0.25)
          end,
          row = function()
            return vim.o.lines - math.floor(vim.o.lines * 0.25)
          end,
          col = 0,
        },
      })

      -- 🚀 Keymaps
      vim.keymap.set({ "n", "t" }, "<leader>;", function()
        right:toggle()
      end, { desc = "Right Terminal" })

      vim.keymap.set({ "n", "t" }, "<leader>a", function()
        left:toggle()
      end, { desc = "Left Terminal" })

      vim.keymap.set({ "n", "t" }, "<leader>o", function()
        bottom:toggle()
      end, { desc = "Bottom Terminal" })

      -- ⚡ Exit terminal mode fast
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })

      -- ⚡ Navigation between splits
      vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
      vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
      vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
      vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])

      -- 🎨 Minimal light border (clean UI look)
      vim.api.nvim_set_hl(0, "FloatBorder", {
        fg = "#6e6e6e", -- soft gray border
        bg = "none",
      })

      vim.api.nvim_set_hl(0, "NormalFloat", {
        bg = "none",
      })
    end,
  },
}
