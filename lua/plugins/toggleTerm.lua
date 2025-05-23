return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 40
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        start_in_insert = true,
        persist_size = true,
        close_on_exit = true,
        shell = vim.o.shell,
      })

      local Terminal = require("toggleterm.terminal").Terminal

      local horiz = Terminal:new({ direction = "horizontal" })
      local vert = Terminal:new({ direction = "vertical" })
      local float = Terminal:new({ direction = "float" })
      local tab = Terminal:new({ direction = "tab" })

      local all_terms = { horiz, vert, float, tab }

      local function any_terminal_open()
        for _, t in ipairs(all_terms) do
          if t:is_open() then
            return true
          end
        end
        return false
      end

      local function safe_toggle(term)
        if term:is_open() then
          term:toggle() -- close if already open
        elseif not any_terminal_open() then
          term:toggle() -- open if none is open
        else
          vim.notify("CCT", vim.log.levels.WARN)
        end
      end

      -- Only bind these in normal mode, not terminal mode
      vim.keymap.set({ "n", "t" }, "<leader>a", function()
        safe_toggle(horiz)
      end, { desc = "Toggle Horizontal Terminal" })

      vim.keymap.set({ "n", "t" }, "<leader>;", function()
        safe_toggle(float)
      end, { desc = "Toggle Floating Terminal" })

      vim.keymap.set({ "n", "t" }, "<leader>o", function()
        safe_toggle(vert)
      end, { desc = "Toggle Vertical Terminal" })

      -- Terminal navigation keybindings (still active in terminal mode)
      vim.cmd([[
        tnoremap <C-S-h> <C-\><C-n><C-w>h
        tnoremap <C-S-j> <C-\><C-n><C-w>j
        tnoremap <C-S-k> <C-\><C-n><C-w>k
        tnoremap <C-S-l> <C-\><C-n><C-w>l
      ]])

      -- Exit terminal insert mode with <Esc>
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    end,
  },
}
