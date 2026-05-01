return {
  {
    "dmtrKovalenko/fff.nvim",
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    keys = {
      -- 🔍 FIND FILES
      { ";f", function() require("fff").find_files() end, desc = "Find Files" },
      
      -- 🔎 LIVE GREP
      { ";r", function() require("fff").live_grep() end, desc = "Live Grep" },

    },
    opts = {
      -- 🌎 GLOBAL DEFAULTS (95% Horizontal)
      layout = {
        width = 0.95,
        height = 0.95,
        prompt_position = "top",
        preview_position = "right",
        preview_size = 0.55,
      },
      -- 🏎️ RUST-POWERED FILTERS
      file_ignore_patterns = {
        "node_modules", ".git/", ".next/", "dist/", "build/",
        "%.lock", "%.png", "%.jpg", "%.jpeg", "%.pdf", "%.zip"
      },
    },
    config = function(_, opts)
      require("fff").setup(opts)
    end,
  },
}
