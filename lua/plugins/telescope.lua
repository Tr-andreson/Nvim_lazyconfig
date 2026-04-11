return {
	{
		"nvim-telescope/telescope.nvim",
		version = false,
		cmd = "Telescope",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-file-browser.nvim",
		},
		keys = {
			{
				";e",
				function()
					require("telescope.builtin").diagnostics()
				end,
				desc = "Diagnostics",
			},
			{
				"sf",
				function()
					local telescope = require("telescope")
					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { height = 40 },
					})
				end,
				desc = "File browser (current buffer dir)",
			},
		},
		opts = function(_, opts)
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,

				-- 🔥 REMOVE BORDERS
				border = true,
				borderchars = {
					"─", -- top
					"│", -- right
					"─", -- bottom
					"│", -- left
					"╭", -- top-left
					"╮", -- top-right
					"╯", -- bottom-right
					"╰", -- bottom-left
				},

				file_ignore_patterns = {
					"node_modules/*",
					"public/*",
					".next/*",
					".git/*",
				},
			})

			opts.pickers = {
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
					layout_config = { preview_cutoff = 9999 },
					border = false,
				},
			}

			opts.extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,

					-- 🔥 REMOVE BORDER HERE TOO
					border = false,

					mappings = {
						["n"] = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["<C-u>"] = function(prompt_bufnr)
								for _ = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for _ = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
						},
					},
				},
			}

			return opts
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
		end,
	},
}
