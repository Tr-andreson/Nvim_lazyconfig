return {
  {
    "napmn/react-extract.nvim",
    config = function()
      require("react-extract").setup()
    end,

    keys = {
      -- Keybinding to extract JSX to a new component
      {
        "<leader>rc", -- Replace with your preferred keybinding
        function()
          require("react-extract").extract_to_current_file()
        end,
        desc = "Extract JSX to the current file",
      },
    },
  },
}
