return {
  -- Other plugins here

  {
    "napmn/react-extract.nvim",
    config = function()
      require("react-extract").setup()

      -- Keymaps for react-extract
      vim.keymap.set(
        { "v" },
        "<Leader>re",
        require("react-extract").extract_to_new_file,
        { desc = "Extract to New File" }
      )
      vim.keymap.set(
        { "v" },
        "<Leader>rc",
        require("react-extract").extract_to_current_file,
        { desc = "Extract to Current File" }
      )
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Ensure treesitter is installed
  },

  -- Other plugins here
}
