return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "ivy",
					},
					live_grep = {
						theme = "ivy",
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			require("telescope").load_extension("fzf")

			local builtin = require("telescope.builtin")

			vim.keymap.set(
				"n",
				"<leader>ff",
				"<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>",
				{ desc = "[P]Open telescope find files" }
			)
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

			vim.keymap.set(
				"n",
				"<leader>b",
				"<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<cr>",
				{ desc = "[P]Open telescope buffers" }
			)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
