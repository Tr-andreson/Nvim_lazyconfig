return {
  -- disable trouble
  { "folke/trouble.nvim", enabled = true },
  {
    "echasnovski/mini.animate",
    enabled = false,
  },
  { "nvim-treesitter/nvim-treesitter-context", enabled = false },
  { "nvim-treesitter/nvim-treesitter-textobjects", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },
  {
    "stevearc/dressing.nvim",
    enabled = false,
  },
}
