return {
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    cmd = "ZenMode",
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    opts = {
      plugins = {
        twilight = { enabled = false }, -- we will toggle manually
      },
      on_open = function()
        require("twilight").enable()
      end,
      on_close = function()
        require("twilight").disable()
      end,
    },
  },
  {
    "folke/twilight.nvim",
    event = "VeryLazy",
    opts = {}, -- default options are fine, you can customize if needed
  },
}
