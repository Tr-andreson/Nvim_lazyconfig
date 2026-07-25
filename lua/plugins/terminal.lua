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

      -- ─── Terminals ──────────────────────────────────────────────
      local right = Terminal:new({
        hidden = true,
        direction = "float",
        float_opts = {
          border = "single",
          width = function() return math.floor(vim.o.columns * 0.5) end,
          height = function() return vim.o.lines end,
          row = 0,
          col = function() return vim.o.columns - math.floor(vim.o.columns * 0.5) end,
        },
      })

      local left = Terminal:new({
        hidden = true,
        direction = "float",
        float_opts = {
          border = "single",
          width = function() return math.floor(vim.o.columns * 0.6) end,
          height = function() return vim.o.lines end,
          row = 0,
          col = 0,
        },
      })

      -- ─── Keymaps ──────────────────────────────────────────────────
      vim.keymap.set({ "n", "t" }, "<leader>;", function() right:toggle() end, { desc = "Right Terminal" })
      vim.keymap.set({ "n", "t" }, "<leader>a", function() left:toggle() end, { desc = "Left Terminal" })

      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })
      vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
      vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
      vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
      vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])

      -- ─── FIX: Border Colors (THIS ACTUALLY WORKS) ──────────────
      -- The correct highlight groups for toggleterm
      vim.cmd([[
        highlight! FloatBorder guifg=#3a3a3a guibg=NONE
        highlight! NormalFloat guibg=NONE
      ]])

      -- Also set with nvim_set_hl for persistence
      vim.api.nvim_set_hl(0, "FloatBorder", {
        fg = "#3a3a3a",
        bg = "none",
      })
      vim.api.nvim_set_hl(0, "NormalFloat", {
        bg = "none",
      })

      -- ─── Alternative: Force via ToggleTerm namespace ────────────
      vim.api.nvim_set_hl(0, "ToggleTermFloatBorder", {
        fg = "#3a3a3a",
        bg = "none",
      })
      vim.api.nvim_set_hl(0, "ToggleTermNormalFloat", {
        bg = "none",
      })

      -- ─── DEBUG: Check if highlights are applied ────────────────
      -- Uncomment to see if highlights exist
      -- print(vim.inspect(vim.api.nvim_get_hl(0, { name = "FloatBorder" })))
    end,
  },
}
