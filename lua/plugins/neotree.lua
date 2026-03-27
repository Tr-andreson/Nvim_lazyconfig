return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    -- 🔑 Toggle key inside config
    vim.keymap.set("n", "<leader>e", function()
      require("neo-tree.command").execute({ toggle = true })
    end, { desc = "NeoTree Toggle" })

    require("neo-tree").setup({
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },

      -- window = {
      --   width = 25,
      -- },

      default_component_configs = {
        icon = {
          enabled = false, -- ❌ no icons
        },
        git_status = {
          symbols = {
            added     = "",
            modified  = "",
            deleted   = "",
            renamed   = "",
            untracked = "",
            ignored   = "",
            unstaged  = "",
            staged    = "",
            conflict  = "",
          },
        },
      },
    })
  end,
}

