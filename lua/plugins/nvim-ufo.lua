return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "BufReadPost",
    config = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require("ufo").setup({
        open_fold_hl_timeout = 400,
        close_fold_kinds_for_ft = {
          default = { "imports" },
        },
        provider_selector = function(bufnr, filetype, buftype)
          return { "lsp", "indent" }
        end,
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = ("  %d lines "):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
              curWidth = curWidth + chunkWidth
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              table.insert(newVirtText, { chunkText, chunk[2] })
              curWidth = curWidth + vim.fn.strdisplaywidth(chunkText)
              if curWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth)
              end
              break
            end
          end
          table.insert(newVirtText, { suffix, "MoreMsg" })
          return newVirtText
        end,
        preview = {
          win_config = {
            border = { "", "─", "", "", "", "─", "", "" },
            winhighlight = "Normal:Folded",
            winblend = 0,
          },
          mappings = {
            scrollU = "<C-u>",
            scrollD = "<C-d>",
          },
        },
      })

      -- Keymaps
      local map = vim.keymap.set
      map("n", "zo", require("ufo").openAllFolds, { desc = "Open All Folds" })
      map("n", "zk", require("ufo").closeAllFolds, { desc = "Close All Folds" })
      map("n", "zp", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek Folded Lines" })
    end,
  },
}
