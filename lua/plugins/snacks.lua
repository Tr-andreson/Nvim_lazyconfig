return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- 🛠️ Corrected Terminal Setup
			terminal = {
				enabled = true,
				win = {
					style = "terminal",
					position = "float",
					border = "rounded",
					backdrop = 60,
					width = 0.6,
					height = 0,        -- 🟢 0 = Full height (covers the top)
					row = 0,           -- 🟢 0 = Starts at the very top
					col = 0,
				},
			},
		},
		keys = {
			-- 🚀 Toggle Terminal
			{ "<space>a", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal", mode = { "n", "t" } },

			-- 🔥 Terminal Mode Mappings
			{ "<Esc>",    [[<C-\><C-n>]],                          mode = "t",               { desc = "Normal Mode", nowait = true, silent = true } },
			{ "<C-v>",    [[<C-\><C-n>"+pa]],                      mode = "t",               desc = "Paste from System" },

			-- Window Navigation from within Terminal
			{ "<C-S-h>",  [[<C-\><C-n><C-w>h]],                    mode = "t",               desc = "Go to Left Window" },
			{ "<C-S-j>",  [[<C-\><C-n><C-w>j]],                    mode = "t",               desc = "Go to Lower Window" },
			{ "<C-S-k>",  [[<C-\><C-n><C-w>k]],                    mode = "t",               desc = "Go to Upper Window" },
			{ "<C-S-l>",  [[<C-\><C-n><C-w>l]],                    mode = "t",               desc = "Go to Right Window" },
		},
	},
}
