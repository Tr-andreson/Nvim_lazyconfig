return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    vim.keymap.set("n", "<leader>e", function()
      require("neo-tree.command").execute({
        toggle = true,
        position = "float",
      })
    end, { desc = "NeoTree Float Toggle" })

    require("neo-tree").setup({
      window = {
        position = "float",

        popup = {
          -- size = {
          --   height = "80%",
          --   width = "50%",
          -- },
					size = {
						width = 60,
						height = 25,
					},

          position = "50%", -- center

          border = {
            style = "rounded",
          },
        },
      },

      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },

      default_component_configs = {
        icon = {
          enabled = false,
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
