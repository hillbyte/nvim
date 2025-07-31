return {
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		main = "ibl",
		opts = {
			indent = {
				-- ['|', '¦', '┆', '┊']
				char = "¦",
			},
			scope = {
				enabled = false,
			},
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
	},
}
