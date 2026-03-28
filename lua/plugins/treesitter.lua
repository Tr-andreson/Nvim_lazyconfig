return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

	event = { "BufReadPost", "BufNewFile" }, -- 🔥 REQUIRED

    -- 🔥 THIS FIXES YOUR ISSUE
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then
        return
      end

      configs.setup({
        ensure_installed = {
          "html",
          "cpp",
          "javascript",
          "typescript",
          "tsx",
          "rust",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}


