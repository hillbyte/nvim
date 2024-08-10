--
-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			require("mason-lspconfig").setup({
-- 				ensure_installed = { "lua_ls", "tsserver" },
-- 			})
-- 		end,
-- 	},
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		lazy = false,
-- 		config = function()
-- 			local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- 			local lspconfig = require("lspconfig")
--
-- 			-- Lua LSP setup
-- 			lspconfig.lua_ls.setup({
-- 				capabilities = capabilities,
-- 			})
--
-- 			-- TypeScript/JavaScript LSP setup
-- 			lspconfig.tsserver.setup({
-- 				capabilities = capabilities,
-- 				-- Optimize for performance
-- 				-- init_options = {
-- 				-- 	maxTsServerMemory = 376, -- Limit tsserver memory usage (in MB)
-- 				-- 	disableAutomaticTypingAcquisition = true, -- Disable unnecessary features
-- 				-- },
-- 				-- flags = {
-- 				-- 	debounce_text_changes = 150, -- Debounce text changes for better performance
-- 				-- },
-- 				-- handlers = {
-- 				-- 	["textDocument/publishDiagnostics"] = vim.lsp.with(
-- 				-- 		vim.lsp.diagnostic.on_publish_diagnostics,
-- 				-- 		{ virtual_text = false } -- Disable virtual text for less clutter
-- 				-- 	),
-- 				-- },
-- 				-- root_dir = function(fname)
-- 				-- 	return lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", ".git")(fname)
-- 				-- 		or lspconfig.util.path.dirname(fname)
-- 				-- end,
-- 				-- single_file_support = true, -- Avoid loading unnecessary files
-- 			})
--
-- 			-- Keymaps
-- 			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- 			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
-- 			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
-- 		end,
-- 	},
-- }

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Lua LSP setup
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- TypeScript/JavaScript LSP setup
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				-- 	init_options = {
				-- 		maxTsServerMemory = 512, -- Further reduce memory limit to 1GB
				-- 		disableAutomaticTypingAcquisition = true,
				-- 	},
				-- 	flags = {
				-- 		debounce_text_changes = 150,
				-- 	},
				-- 	handlers = {
				-- 		["textDocument/publishDiagnostics"] = vim.lsp.with(
				-- 			vim.lsp.diagnostic.on_publish_diagnostics,
				-- 			{ virtual_text = false }
				-- 		),
				-- 	},
				-- 	root_dir = function(fname)
				-- 		return lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", ".git", "node_modules")(fname)
				-- 			or lspconfig.util.path.dirname(fname)
				-- 	end,
				-- 	-- Exclude `node_modules` folder
				-- 	single_file_support = true,
			})

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
