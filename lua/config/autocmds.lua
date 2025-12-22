-- Autocmds are automatically loaded on the VeryLazy event
--
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Disable autoformat for lua files
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Full black float windows (Lazygit, fzf, terminals, etc.)
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000", fg = "#d0d5db" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000", fg = "#333333" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", fg = "#d0d5db" })

    -- Terminal cursor
    vim.api.nvim_set_hl(0, "TermCursor", { fg = "#000000", bg = "#d0d5db" })

    -- Fully black terminal colors for Lazygit inside Neovim
    vim.g.terminal_color_0 = "#000000" -- black
    vim.g.terminal_color_8 = "#111111" -- bright black

    -- You can keep other colors or customize them:
    vim.g.terminal_color_1 = "#ff5555"
    vim.g.terminal_color_2 = "#50fa7b"
    vim.g.terminal_color_3 = "#f1fa8c"
    vim.g.terminal_color_4 = "#8be9fd"
    vim.g.terminal_color_5 = "#bd93f9"
    vim.g.terminal_color_6 = "#8be9fd"
    vim.g.terminal_color_7 = "#bbbbbb"

    vim.g.terminal_color_9 = "#ff6e6e"
    vim.g.terminal_color_10 = "#69ff94"
    vim.g.terminal_color_11 = "#ffffa5"
    vim.g.terminal_color_12 = "#a4ffff"
    vim.g.terminal_color_13 = "#d6acff"
    vim.g.terminal_color_14 = "#a4ffff"
    vim.g.terminal_color_15 = "#eeeeee"
  end,
})
