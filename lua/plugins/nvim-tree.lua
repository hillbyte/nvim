return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				-- width = 35,
				-- relativenumber = true,
				side = "right",
			},
			-- change folder arrow icons
			--[[ renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
			-- disable window_picker for ]]
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- vim.cmd([[
		-- 	highlight NvimTreeFolderIcon guifg=#e9c46a
		-- 	highlight NvimTreeFolderName guifg=#808080
		--     highlight NvimTreeNormal guibg=#1e1e2e
		-- ]])

		vim.cmd([[
  highlight NvimTreeFolderIcon guifg=#f9e2af " Pastel yellow (Catppuccin yellow)
  highlight NvimTreeFolderName guifg=#a6e3a1 " Pastel green (Catppuccin green)
]])
		-- highlight NvimTreeNormal guibg=#1e1e2e     " Dark purple-gray (Catppuccin mantle)

		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
