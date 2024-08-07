return {
	-- LuaSnip plugin
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		config = function()
			local ls = require("luasnip")

			-- Define custom snippets
			ls.snippets = {
				lua = {
					ls.parser.parse_snippet("fn", "function ${1:name}(${2:args})\n  ${3:-- body}\nend"),
				},
				javascript = {
					-- React Functional Component
					ls.parser.parse_snippet(
						"rfc",
						"const ${1:ComponentName} = () => {\n  return (\n    <div>\n      ${2:/* content */}\n    </div>\n  );\n};\n\nexport default ${1:ComponentName};"
					),
					-- Async Function
					ls.parser.parse_snippet(
						"afn",
						"const ${1:funcName} = async (${2:args}) => {\n  ${3:/* body */}\n};"
					),
					-- Regular Function
					ls.parser.parse_snippet("fn", "function ${1:funcName}(${2:args}) {\n  ${3:/* body */}\n}"),
					-- Console Log
					ls.parser.parse_snippet("clg", "console.log(${1:msg});"),
				},
			}

			-- Key mappings for snippet expansion and navigation
			vim.api.nvim_set_keymap(
				"i",
				"<C-k>",
				'<cmd>lua require("luasnip").expand_or_jump()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"s",
				"<C-k>",
				'<cmd>lua require("luasnip").expand_or_jump()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"i",
				"<C-j>",
				'<cmd>lua require("luasnip").jump(-1)<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"s",
				"<C-j>",
				'<cmd>lua require("luasnip").jump(-1)<CR>',
				{ noremap = true, silent = true }
			)
		end,
	},
}
