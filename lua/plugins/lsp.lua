return {
  {
    "neovim/nvim-lspconfig",
    config = function()

      ------------------------------------
      -- 🔧 Global settings (once)
      ------------------------------------
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
      })

      vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)
      vim.opt.completeopt = { "menu", "menuone", "noselect" }

      ------------------------------------
      -- 🔑 LSP keymaps (on attach)
      ------------------------------------
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      ------------------------------------
      -- 🟦 C++ (clangd)
      ------------------------------------
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
        },
      })

      vim.lsp.enable("clangd")
    end,
  },

  ------------------------------------
  -- 🟨 TypeScript
  ------------------------------------
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("typescript-tools").setup({
        settings = {
          separate_diagnostic_server = true,
          publish_diagnostic_on = "insert_leave",
          tsserver_max_memory = 1024,
        },
      })

      ------------------------------------
      -- 🔑 TypeScript keymaps
      ------------------------------------
      local group = vim.api.nvim_create_augroup("TSKeymaps", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        callback = function(args)
          local opts = { buffer = args.buf }

          vim.keymap.set("n", "<space>tam", "<cmd>TSLspAddMissingImports<CR>", opts)
          vim.keymap.set("n", "<space>trf", "<cmd>TSLspRenameFile<CR>", opts)

          -- combo
          vim.keymap.set("n", "<space>toi", function()
            vim.cmd("TSLspOrganize")
            vim.cmd("TSLspRemoveUnused")
          end, opts)

		  vim.keymap.set("n", "cl", function()
			  local var = vim.fn.expand("<cword>")
			  vim.api.nvim_feedkeys(
				"o"
				  .. "console.log("
				  .. var
				  .. ', "'
				  .. var
				  .. ' debug");'
				  .. vim.api.nvim_replace_termcodes("<Esc>", true, true, true),
				"n",
			 true
			  )
		end, { desc = "Add console.log with debug label for variable under cursor" })
				end,
			  })


	  
		vim.keymap.set("n", "cd", function()
		  local var = vim.fn.expand("<cword>") -- gets word under cursor

		  local lines = {
			"if (" .. var .. ") {",
			"  debugger;",
			"}",
		  }

		vim.api.nvim_put(lines, "l", true, true)
		end, { desc = "Insert if block with debugger below" })




		-- Toggle colorcolumn with 'vv'
		-- NOTE: this functin is used for making color column
		vim.keymap.set("n", "vv", function()
		  if vim.opt.colorcolumn:get()[1] == nil then
			vim.opt.colorcolumn = "80,120"
			print("ColorColumn ON: 80, 120")
		  else
			vim.opt.colorcolumn = ""
			print("ColorColumn OFF")
		  end
		end, { desc = "Toggle color column" })
			end,
		  },
		}



