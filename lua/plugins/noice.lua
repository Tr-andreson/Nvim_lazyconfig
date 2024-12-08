return {

  -- Add noice.nvim for command-line UI enhancements
  {
    "folke/noice.nvim",
    event = "VeryLazy", -- Lazy load on a useful event
    config = function()
      require("noice").setup({
        cmdline = {
          view = "cmdline_popup", -- Use floating window for cmdline
          position = {
            row = "50%", -- Vertically center
            col = "50%", -- Horizontally center
          },
        },
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim", -- Required dependency for noice.nvim
    },
  },
}
