return {
	"goolord/alpha-nvim",
	enabled = false,
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		-- headder saying "vim"
		dashboard.section.header.val = {
			[[NVIM]],
		}

		-- dashboard.section.header.val = {
		-- 	[[                                                                       ]],
		-- 	[[                                                                       ]],
		-- 	[[                                                                       ]],
		-- 	[[                                                                       ]],
		-- 	[[                                                                     ]],
		-- 	[[       ████ ██████           █████      ██                     ]],
		-- 	[[      ███████████             █████                             ]],
		-- 	[[      █████████ ███████████████████ ███   ███████████   ]],
		-- 	[[     █████████  ███    █████████████ █████ ██████████████   ]],
		-- 	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
		-- 	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
		-- 	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
		-- 	[[                                                                       ]],
		-- 	[[                                                                       ]],
		-- 	[[                                                                       ]],
		-- }

		alpha.setup(dashboard.opts)
	end,
}
