return {
  "m4xshen/autoclose.nvim",
  event = "InsertEnter", -- lazy load (fast startup)
  opts = {
    keys = {
      ["("] = { escape = false, close = true, pair = "()" },
      ["["] = { escape = false, close = true, pair = "[]" },
      ["{"] = { escape = false, close = true, pair = "{}" },

      ['"'] = { escape = true, close = true, pair = '""' },
      ["'"] = { escape = true, close = true, pair = "''" },
      ["`"] = { escape = true, close = true, pair = "``" },
    },
    options = {
      disabled_filetypes = { "text", "markdown" },
      disable_when_touch = false,
      pair_spaces = false, -- keep minimal (no extra spaces)
      auto_indent = true,
    },
  },
}
