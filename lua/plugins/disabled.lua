return {
  -- disable trouble
  { "folke/trouble.nvim", enabled = true },
  {
    "echasnovski/mini.animate",
    enabled = false,
  },
  { "nvim-treesitter/nvim-treesitter-context", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
}
