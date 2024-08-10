return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- Define a custom theme
		local pastel = {
			normal = {
				a = { fg = "#000000", bg = "#a8e6cf", gui = "bold" },
				b = { fg = "#000000", bg = "#dcedc1" },
				c = { fg = "#000000", bg = "#f0f0f0" },
			},
			insert = {
				a = { fg = "#000000", bg = "#a8e6cf", gui = "bold" },
				b = { fg = "#000000", bg = "#dcedc1" },
				c = { fg = "#000000", bg = "#f0f0f0" },
			},
			visual = {
				a = { fg = "#000000", bg = "#a8e6cf", gui = "bold" },
				b = { fg = "#000000", bg = "#dcedc1" },
				c = { fg = "#000000", bg = "#f0f0f0" },
			},
			replace = {
				a = { fg = "#000000", bg = "#a8e6cf", gui = "bold" },
				b = { fg = "#000000", bg = "#dcedc1" },
				c = { fg = "#000000", bg = "#f0f0f0" },
			},
			command = {
				a = { fg = "#000000", bg = "#a8e6cf", gui = "bold" },
				b = { fg = "#000000", bg = "#dcedc1" },
				c = { fg = "#000000", bg = "#f0f0f0" },
			},
			inactive = {
				a = { fg = "#000000", bg = "#e0e0e0", gui = "bold" },
				b = { fg = "#000000", bg = "#e0e0e0" },
				c = { fg = "#000000", bg = "#e0e0e0" },
			},
		}

		local dark = {
			normal = {
				a = { fg = "#ffffff", bg = "#000000", gui = "bold" },
				b = { fg = "#ffffff", bg = "#333333" },
				c = { fg = "#ffffff", bg = "#444444" },
			},
			insert = {
				a = { fg = "#ffffff", bg = "#005f87", gui = "bold" },
				b = { fg = "#ffffff", bg = "#005f87" },
				c = { fg = "#ffffff", bg = "#005f87" },
			},
			visual = {
				a = { fg = "#ffffff", bg = "#870000", gui = "bold" },
				b = { fg = "#ffffff", bg = "#870000" },
				c = { fg = "#ffffff", bg = "#870000" },
			},
			replace = {
				a = { fg = "#ffffff", bg = "#d70000", gui = "bold" },
				b = { fg = "#ffffff", bg = "#d70000" },
				c = { fg = "#ffffff", bg = "#d70000" },
			},
			command = {
				a = { fg = "#ffffff", bg = "#5f00af", gui = "bold" },
				b = { fg = "#ffffff", bg = "#5f00af" },
				c = { fg = "#ffffff", bg = "#5f00af" },
			},
			inactive = {
				a = { fg = "#ffffff", bg = "#444444", gui = "bold" },
				b = { fg = "#ffffff", bg = "#444444" },
				c = { fg = "#ffffff", bg = "#444444" },
			},
		}

		-- Ensure the status line is always shown
		vim.o.laststatus = 2
		-- Set the command line height to 1
		vim.o.cmdheight = 1

		require("lualine").setup({
			options = {
				theme = dark,
				-- Ensure the status line is at the bottom
				section_separators = "",
				component_separators = "",
			},
		})
	end,
}
