return {
	{
		"AndrewRadev/tagalong.vim",
		enabled = true,
		ft = {
			"html",
			"xml",
			"jsx",
			"tsx",
			"eruby",
			"ejs",
			"eco",
			"php",
			"handlebars",
			"javascriptreact",
			"typescriptreact",
		},
		config = function()
			-- Optional: Set any configuration options here
			vim.g.tagalong_verbose = 1 -- Set to 0 to disable verbose mode
			vim.g.tagalong_filetypes = {
				"html",
				"xml",
				"jsx",
				"tsx",
				"eruby",
				"ejs",
				"eco",
				"php",
				"handlebars",
				"javascriptreact",
				"typescriptreact",
			}
		end,
	},
}
