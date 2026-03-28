return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    lazy = false, -- 🔥 FORCE LOAD (important)

    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "html",
          "javascript",
          "typescript",
          "tsx",
          "cpp",
          "rust",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
