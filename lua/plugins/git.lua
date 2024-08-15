return {
	{
		"tpope/vim-fugitive",
		lazy = true,
		cmd = { "Git", "Gdiffsplit", "Gvdiffsplit", "Gstatus", "Gblame", "Gwrite" },
		keys = {
			{ "<leader>gs", ":Git status<CR>", desc = "Git status" },
			{ "<leader>gd", ":Gdiffsplit<CR>", desc = "Git diff" },
			{ "<leader>gb", ":Git blame<CR>", desc = "Git blame" },
			{ "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
			{ "<leader>gp", ":Git push<CR>", desc = "Git push" },
			{ "<leader>gl", ":Git pull<CR>", desc = "Git pull" },
			{ "<leader>gaa", ":Git add .<CR>", desc = "Git add all files" },
			{ "<leader>gaf", ":Git add %<CR>", desc = "Git add current file" },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = "LazyGit",
		keys = {
			{ "<leader>gg", ":LazyGit<CR>", desc = "Open LazyGit" },
		},
		config = function()
			--set custom configurations here
			vim.g.lazygit_floating_window_use_plenary = 0
			vim.g.lazygit_floating_window_winblend = 0
		end,
	},
}
