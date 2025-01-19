return {
  -- Add the plugin
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<C-t>]], -- Map Ctrl + t to toggle the terminal
      direction = "float", -- Use floating terminal
      float_opts = {
        border = "curved",
        winblend = 10,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
    end,
  },
}
