return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        view = "cmdline_popup", -- use popup for cmdline
      },
      views = {
        cmdline_popup = {
          position = {
            row = 0, -- top of the screen
            col = "50%", -- centered horizontally
          },
          size = {
            width = "30%", -- span full width
          },
          border = {
            style = "rounded",
          },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
}
