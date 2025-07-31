return {
	{
		"pieces-app/plugin_neovim",
		enabled = false,
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
			"nvim-telescope/telescope.nvim",
		},

		config = function()
			require("pieces.config").host = "http://localhost:5323"
		end,
	},
}
