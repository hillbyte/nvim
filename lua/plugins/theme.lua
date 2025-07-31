return {
	{
		"catppuccin/nvim",
		enabled = false,
		lazy = false,
		name = "catppuccin",
		priority = 1001,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	--[[ 	{
		"folke/tokyonight.nvim",
		enable = false,
		lazy = false,
		opts = {},
		config = function()
			require("tokyonight").setup({
				-- use the night style
				style = "night",

				-- Change the "hint" color to the "orange" color, and make the "error" color bright redo
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	}, ]]
	{
		"ellisonleao/gruvbox.nvim",
		enabled = true,
		lazy = false,
		name = "gruvbox",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
			vim.opt.background = "dark"
		end,
	},
	{
		"maxmx03/solarized.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {},
		config = function(_, opts)
			vim.o.termguicolors = true
			vim.o.background = "dark"
			require("solarized").setup(opts)
			vim.cmd.colorscheme("solarized")
		end,
	},
	{
		"sainnhe/everforest",
		enabled = false,
		lazy = false,
		name = "everforest",
		priority = 1000,
		config = function()
			-- Everforest theme configuration
			vim.g.everforest_background = "soft" -- Set background style to 'soft'
			vim.g.everforest_better_performance = 1 -- Enable performance optimizations for the theme
			vim.g.everforest_enable_italic = 1 -- Enable italics (optional)
			vim.g.everforest_diagnostic_text_highlight = 1 -- Highlight diagnostic text (optional)

			-- Set the light variant of the theme
			vim.cmd("set background=dark")
			vim.cmd.colorscheme("everforest")
		end,
	},
	{
		"rose-pine/neovim",
		enabled = false,
		lazy = false,
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup()
			vim.cmd.colorscheme("rose-pine-moon")
		end,
	},
	{
		"olivercederborg/poimandres.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				-- disable_background = true,
				-- disable_float_background = true,
			})
		end,

		-- optionally set the colorscheme within lazy config
		init = function()
			vim.cmd("colorscheme poimandres")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				-- transparent = false,
			})
			vim.cmd.colorscheme("kanagawa")
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		name = "nordic",
		config = function()
			require("nordic").setup({
				transparent_background = true,
			})
			vim.cmd.colorscheme("nordic")
		end,
	},
}
