return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        twilight = true, -- Dim inactive text while in Zen Mode
        kitty = { enabled = false, font = "12" }, -- Set font size to 12 in Kitty
      },
      -- on_open = function()
      -- vim.g.previous_colorscheme = vim.g.colors_name -- Store current colorscheme
      -- vim.cmd("colorscheme solarized-osaka") -- Change to Zen Mode colorscheme
      -- vim.notify("Zen Mode Activated - Font Size Set to 12", vim.log.levels.INFO)
      -- end,
      -- on_close = function()
      -- if vim.g.previous_colorscheme then
      -- vim.cmd("colorscheme " .. vim.g.previous_colorscheme) -- Restore original colorscheme
      -- vim.notify("Zen Mode Exited - Restored Colorscheme", vim.log.levels.INFO)
      -- end
      -- end,
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  -- Twilight.nvim for dimming inactive text
  {
    "folke/twilight.nvim",
    opts = {
      dimming = { alpha = 0.25 },
    },
  },

  -- No-Neck-Pain.nvim for centering text
  {
    "shortcuts/no-neck-pain.nvim",
    opts = {
      width = 80, -- Adjust as needed for a comfortable reading experience
    },
  },
}
