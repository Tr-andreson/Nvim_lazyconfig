return {

  {
    "jose-elias-alvarez/typescript.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("typescript").setup({
        server = {
          on_attach = function(client, bufnr)
            -- your lsp on_attach logic here
          end,
        },
      })
    end,
  },
}
