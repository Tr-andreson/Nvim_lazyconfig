return {
	{
		"nvim-telescope/telescope.nvim",
		version = false,
		cmd = "Telescope",

		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-file-browser.nvim",
		},

		keys = {
			-- 🔍 FIND FILES
			{
				";f",
				function()
					require("telescope.builtin").find_files({
						hidden = true,
						no_ignore = false,
					})
				end,
				desc = "Find Files",
			},

			-- 🔎 LIVE GREP
			{
				";r",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live Grep",
			},

			{
				"sf",
				function()
					require("telescope").extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = vim.fn.expand("%:p:h"),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						initial_mode = "normal",
						previewer = false,
						layout_strategy = "horizontal",
						layout_config = {
							-- 🔥 SPECIFIC FOR SF
							width = 0.90,
							height = 0.80,
						},
					})
				end,
				desc = "File Browser",
			},


		},

		opts = function()
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			return {
				defaults = {
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",

					-- 🔥 95% HORIZONTAL LAYOUT
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55, -- Adjust how much space the code preview takes
							results_width = 0.8,
						},
						width = 0.95, -- 95% Screen Width
						height = 0.95, -- 95% Screen Height
						preview_cutoff = 120,
					},

					path_display = { "truncate" },
					winblend = 0,
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob",
						"!**/.git/*",
					},

					file_ignore_patterns = {
						"node_modules", ".git/", ".next/", "dist/", "build/",
						"%.lock", "%.png", "%.jpg", "%.jpeg", "%.pdf", "%.zip",
					},
				},

				pickers = {
					find_files = {
						find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
					},
					buffers = {
						show_all_buffers = true,
						sort_lastused = true,
						theme = "dropdown",
						previewer = false,
						mappings = {
							i = { ["<C-d>"] = actions.delete_buffer },
							n = { ["dd"] = actions.delete_buffer },
						},
					},
				},

				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					file_browser = {
						hijack_netrw = true,
						mappings = {
							["n"] = {
								["h"] = fb_actions.goto_parent_dir,
								["N"] = fb_actions.create,
								["<C-u>"] = function(buf)
									for _ = 1, 10 do actions.move_selection_previous(buf) end
								end,
								["<C-d>"] = function(buf)
									for _ = 1, 10 do actions.move_selection_next(buf) end
								end,
							},
						},
					},
				},
			}
		end,

		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
		end,
	},
}
