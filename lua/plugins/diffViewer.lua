return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open" },
    { "<leader>gd", "<cmd>DiffviewClose<cr>", desc = "Diffview: Close" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: File History" },
    {
      "<leader>gH",
      "<cmd>DiffviewFileHistory %<cr>",
      desc = "Diffview: Current File History",
    },
  },
}
