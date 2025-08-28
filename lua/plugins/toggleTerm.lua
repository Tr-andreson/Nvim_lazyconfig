return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
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

      -- Regular terminals
      local horiz = Terminal:new({ direction = "horizontal" })
      local float = Terminal:new({ direction = "float" })
      local tab = Terminal:new({ direction = "tab" })

      -- Vertical overlay terminal (right side, 40% width)
      local vert_overlay = Terminal:new({
        direction = "float",
        float_opts = {
          border = "rounded",
          width = function()
            return math.floor(vim.o.columns * 0.4)
          end,
          height = function()
            return vim.o.lines
          end,
          row = 0,
          col = function()
            return vim.o.columns - math.floor(vim.o.columns * 0.4)
          end,
        },
      })

      -- Horizontal overlay terminal (bottom, 60% height)
      local horiz_overlay = Terminal:new({
        direction = "float",
        float_opts = {
          border = "rounded",
          width = function()
            return vim.o.columns
          end,
          height = function()
            return math.floor(vim.o.lines * 0.6)
          end,
          row = function()
            return vim.o.lines - math.floor(vim.o.lines * 0.6)
          end,
          col = 0,
        },
      })

      -- Group for checking multiple terminals
      local all_terms = { horiz, float, tab, vert_overlay, horiz_overlay }

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
          term:toggle()
        elseif not any_terminal_open() then
          term:toggle()
        else
          vim.notify("Another terminal is already open", vim.log.levels.WARN)
        end
      end

      -- Keymaps
      -- vim.keymap.set({ "n", "t" }, "<leader>a", function()
      --   safe_toggle(horiz)
      -- end, { desc = "Toggle Horizontal Split Terminal" })

      vim.keymap.set({ "n", "t" }, "<leader>o", function()
        safe_toggle(float)
      end, { desc = "Toggle Floating Terminal" })

      vim.keymap.set({ "n", "t" }, "<leader>;", function()
        safe_toggle(vert_overlay)
      end, { desc = "Toggle Vertical Overlay Terminal" })

      vim.keymap.set({ "n", "t" }, "<leader>a", function()
        safe_toggle(horiz_overlay)
      end, { desc = "Toggle Horizontal Overlay Terminal" })

      -- vim.keymap.set({ "n", "t" }, "<leader>t", function()
      --   safe_toggle(tab)
      -- end, { desc = "Toggle Tab Terminal" })

      -- Terminal navigation
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
