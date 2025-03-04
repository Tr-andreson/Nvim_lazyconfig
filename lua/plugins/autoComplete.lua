return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = true,
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local autocomplete_enabled = false -- Track the autocompletion state

      -- Disable automatic completion initially
      opts.completion = {
        autocomplete = false, -- Disable auto-triggering of completion
      }

      -- Add sources for completion
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "crates", priority = 750 },
      }))

      -- Key mappings for completion
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.complete(), -- Manual completion with Ctrl + P
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection with Enter
        ["<Down>"] = cmp.mapping.select_next_item(), -- Navigate down in the completion menu
        ["<Up>"] = cmp.mapping.select_prev_item(), -- Navigate up in the completion menu
      })

      -- Key mapping to toggle autocompletion on/off with Ctrl + T
      vim.api.nvim_set_keymap("n", "<C-t>", "", {
        noremap = true,
        silent = true,
        callback = function()
          autocomplete_enabled = not autocomplete_enabled
          if autocomplete_enabled then
            print("Autocompletion: Enabled")
            cmp.setup({
              completion = { autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged } },
            })
          else
            print("Autocompletion: Disabled")
            cmp.setup({
              completion = { autocomplete = false },
            })
          end
        end,
      })
    end,
  },
}
