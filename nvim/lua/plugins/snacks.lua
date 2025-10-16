return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		terminal = {
			enabled = true,
			start_insert = false,
			auto_insert = false,
			win = {
				keys = {
					term_normal = {
						"<Esc>",
						function()
							vim.cmd("stopinsert")
						end,
						mode = "t",
						desc = "Exit terminal mode",
					},
				},
			},
		},
		lazygit = { enabled = true },
	},
	keys = {
		{
			"<C-\\>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
