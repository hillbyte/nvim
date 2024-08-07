return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				-- ensure_installed = {"lua", "javascript","typescript","c","html"},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				context_commentstring = {
					enable = true,
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
					-- Only calculate commentstring for tsx filetypes
					if vim.bo.filetype == "typescriptreact" or vim.bo.filetype == "javascriptreact" then
						local U = require("Comment.utils")

						-- Determine whether to use linewise or blockwise commentstring
						local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

						-- Determine the location where to calculate commentstring from
						local location = nil
						if ctx.ctype == U.ctype.block then
							location = require("ts_context_commentstring.utils").get_cursor_location()
						elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
							location = require("ts_context_commentstring.utils").get_visual_start_location()
						end

						return require("ts_context_commentstring.internal").calculate_commentstring({
							key = type,
							location = location,
						})
					end
				end,
				-- Customizing the comment format for multiline comments
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
				-- Custom function to format multiline comments
				post_hook = function(ctx)
					if ctx.ctype == require("Comment.utils").ctype.block then
						local srow, scol = unpack(ctx.srow, ctx.scol)
						local erow, ecol = unpack(ctx.erow, ctx.ecol)
						local lines = vim.api.nvim_buf_get_lines(0, srow - 1, erow, false)
						for i, line in ipairs(lines) do
							lines[i] = " " .. line
						end
						vim.api.nvim_buf_set_lines(0, srow - 1, erow, false, lines)
					end
				end,
			})
		end,
	},
}
