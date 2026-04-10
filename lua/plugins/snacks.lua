return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      terminal = {
        enabled = true,
        win = { border = "rounded" },
      },
    },
    keys = {
      -- 🚀 LEFT OVERLAY
      { "<space>a", function() Snacks.terminal.toggle(nil, { win = { position = "left", width = 0.4 } }) end, desc = "Toggle Left Terminal", mode = { "n", "t" } },

      -- 🔥 FIXED ESCAPE LOGIC
      -- We use a raw mapping here to ensure it overrides everything
      { "<Esc>", [[<C-\><C-n>]], mode = "t", { desc = "Normal Mode", nowait = true, silent = true } },
      
      -- 📋 PASTE & NAVIGATION
      { "<C-v>", [[<C-\><C-n>"+pa]], mode = "t", desc = "Paste from System" },
      { "<C-S-h>", [[<C-\><C-n><C-w>h]], mode = "t", desc = "Go to Left Window" },
      { "<C-S-j>", [[<C-\><C-n><C-w>j]], mode = "t", desc = "Go to Lower Window" },
      { "<C-S-k>", [[<C-\><C-n><C-w>k]], mode = "t", desc = "Go to Upper Window" },
      { "<C-S-l>", [[<C-\><C-n><C-w>l]], mode = "t", desc = "Go to Right Window" },
    },
  },
}
