return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- auto_install = true,
				ensure_installed = { "lua", "javascript", "typescript", "tsx", "html", "css" },
				highlight = { enable = true },
				indent = { enable = true },
				context_commentstring = {
					enable = true, -- Enable context-aware comment strings
					enable_autocmd = false,
				},
			})
		end,
	},

	-- Context-aware comment strings
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- Comment.nvim for easy commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = function(ctx)
					-- Only calculate commentstring for tsx and jsx filetypes
					if vim.bo.filetype == "typescriptreact" or vim.bo.filetype == "javascriptreact" then
						local U = require("Comment.utils")

						-- Determine whether to use linewise or blockwise commentstring
						local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

						-- Determine the location to calculate commentstring from
						local location = nil
						if ctx.ctype == U.ctype.block then
							location = require("ts_context_commentstring.utils").get_cursor_location()
						elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
							location = require("ts_context_commentstring.utils").get_visual_start_location()
						end

						-- Use the context-commentstring to calculate the correct commentstring
						return require("ts_context_commentstring.internal").calculate_commentstring({
							key = type,
							location = location,
						})
					end
				end,
				toggler = {
					line = "gcc",
					block = "gbc",
				},
				opleader = {
					line = "gc",
					block = "gb",
				},
				extra = {
					above = "gcO",
					below = "gco",
					eol = "gcA",
				},
				mappings = {
					basic = true,
					extra = true,
				},
			})
		end,
	},
}
