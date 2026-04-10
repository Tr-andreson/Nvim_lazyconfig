return {
	------------------------------------
	-- 🧱 Mason
	------------------------------------
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	------------------------------------
	-- 🔗 Mason ↔ LSP
	------------------------------------
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"ts_ls",
					"lua_ls",
					"gopls",
					"rust_analyzer",
				},
				automatic_installation = true,
			})
		end,
	},

	------------------------------------
	-- 🧠 LSP
	------------------------------------
	{
		"neovim/nvim-lspconfig",
		config = function()
			------------------------------------
			-- 🔧 Global
			------------------------------------
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
			})

			vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)
			vim.opt.completeopt = { "menu", "menuone", "noselect" }

			------------------------------------
			-- 🔑 Keymaps
			------------------------------------
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)

					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<space>fs", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>f", vim.lsp.buf.format, opts)

					vim.keymap.set("n", "<space>t", function()
						vim.lsp.buf.code_action({
							apply = true,
							context = {
								only = { "source.organizeImports.ts" },
								diagnostics = {},
							},
						})
					end, { buffer = args.buf, desc = "Organize/Remove Unused Imports" })

					------------------------------------
					-- 🔥 Simple import fix (replacement)
					------------------------------------
					vim.keymap.set("n", "<space>oi", function()
						vim.lsp.buf.code_action({
							apply = true,
							context = {
								only = { "source.organizeImports.ts" },
								diagnostics = {},
							},
						})
					end, opts)
				end,
			})

			------------------------------------
			-- 🟦 C++
			------------------------------------
			vim.lsp.config("clangd", {
				cmd = { "clangd" },
			})
			vim.lsp.enable("clangd")

			------------------------------------
			-- 🟨 TypeScript (ts_ls)
			------------------------------------
			vim.lsp.config("ts_ls", {})
			vim.lsp.enable("ts_ls")
		end,
	},

	------------------------------------
	-- 🧰 Your utilities (kept)
	------------------------------------
	{
		"nvim-lua/plenary.nvim",
		config = function()
			-- console.log helper
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
			end, { desc = "console.log debug" })

			-- debugger block
			vim.keymap.set("n", "cd", function()
				local var = vim.fn.expand("<cword>")
				local lines = {
					"if (" .. var .. ") {",
					"  debugger;",
					"}",
				}
				vim.api.nvim_put(lines, "l", true, true)
			end, { desc = "Insert debugger block" })

			-- colorcolumn toggle
			vim.keymap.set("n", "vv", function()
				if vim.opt.colorcolumn:get()[1] == nil then
					vim.opt.colorcolumn = "80,120"
					print("ColorColumn ON")
				else
					vim.opt.colorcolumn = ""
					print("ColorColumn OFF")
				end
			end, { desc = "Toggle color column" })
		end,
	},

}
