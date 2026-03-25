return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",

  keys = {
    {
      "<space>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer (NeoTree)",
    },
  },

  opts = {
    close_if_last_window = true,
    enable_git_status = false,
    enable_diagnostics = false,
  },
}
