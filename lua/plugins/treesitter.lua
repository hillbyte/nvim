return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local parsers = { "lua", "javascript", "typescript", "html", "css", "markdown" }

			vim.api.nvim_create_autocmd("FileType", {
				pattern = parsers,
				callback = function(args)
					vim.treesitter.start(args.buf)
				end,
			})

			vim.api.nvim_create_user_command("TSInstallAll", function()
				for _, parser in ipairs(parsers) do
					vim.cmd("TSInstall " .. parser)
				end
			end, {})
		end,
	},
}
