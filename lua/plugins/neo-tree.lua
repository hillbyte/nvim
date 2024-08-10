return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.keymap.set("n", "<leader>r", ":Neotree filesystem toggle right<CR>", {})
			vim.keymap.set("n", "<leader>ef", ":Neotree focus<CR>", {})
			vim.keymap.set("n", "<leader>l", ":Neotree filesystem toggle left<CR>", {})
			vim.keymap.set("n", "<leader>b", ":Neotree buffers toggle float<CR>", {})
			-- Directly open buffer sidebar on the left
			vim.keymap.set("n", "<leader>sb", ":Neotree buffers toggle left<CR>", {})
			-- Buffer navigation using Tab
			vim.keymap.set("n", "<Tab>", ":bnext<CR>", {})
			vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", {})
			-- Focus on code editor
			vim.keymap.set("n", "<leader>cf", function()
				-- Close Neo-tree if it's open
				-- vim.cmd("Neotree close")
				-- Focus on the main editor window
				vim.cmd("wincmd p")
			end, {})
			vim.cmd([[
        highlight NeoTreeDirectoryIcon guifg=#86AB89
        highlight NeoTreeDirectoryName guifg=#808080
      ]])
			require("neo-tree").setup({
				-- filesystem = {
				-- 	-- follow_current_file=true,
				-- 	-- use_libuv_file_watcher = true,
				-- 	hide_dotfiles = false, -- Show hidden files and folders
				-- },
				buffers = {
					hide_dotfiles = false, -- Show hidden buffers (if needed)
				},
			})
			vim.api.nvim_create_autocmd("VimEnter", {
				pattern = "*",
				callback = function()
					-- Open Neo-tree filesystem on the right
					vim.cmd("Neotree filesystem reveal right")
					-- Open Neo-tree buffers on the left
					-- vim.cmd("Neotree buffers reveal left")
					-- Simulate Shift+h to show hidden files
					vim.api.nvim_input("<S-h>")
				end,
			})
		end,
	},
}
