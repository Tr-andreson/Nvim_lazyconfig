return {
  -- Add the plugin
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = vim.o.columns, -- Full width
        open_mapping = [[<leader>tt]],
        direction = "float", -- Use floating window
        float_opts = {
          border = "curved",
        },
      })
    end,
  },
}
