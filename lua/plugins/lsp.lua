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
				ensure_installed = { "lua_ls", "ts_ls", "golangci_lint_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			--[[ lspconfig.eslint_d.setup({
				settings = {
					rootFiles = { ".eslintrc.js", ".eslintrc.yaml", ".eslintrc.json" },
					validate = {
						syntax = "javascript",
					},
				},
			}) ]]

			--[[ 	lspconfig.eslint_lsp.setup({
				on_attach = function(client)
					-- Your on_attach functions here (e.g., keymaps, etc.)
				end,
				settings = {
					eslint = {
						validate = {
							syntax = true,
							javascript = true,
							typescript = true,
						},
					},
				},
			}) ]]

			-- Lua LSP setup
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			--Deno LSP setup
			lspconfig.denols.setup({
				on_attach = on_attach,
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
			})

			-- TypeScript/JavaScript LSP setup
			lspconfig.ts_ls.setup({
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
				single_file_support = true,
			})

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>cx", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			-- -- Function to toggle diagnostics
			-- local diagnostics_active = true
			-- function ToggleDiagnostics()
			-- 	diagnostics_active = not diagnostics_active
			-- 	if diagnostics_active then
			-- 		vim.diagnostic.show(nil, 0)
			-- 		print("LSP Diagnostics Enabled")
			-- 	else
			-- 		vim.diagnostic.hide(nil, 0)
			-- 		print("LSP Diagnostics Disabled")
			-- 	end
			-- end
			--
			--
			-- Function to toggle diagnostics for all buffers
			local diagnostics_active = true
			function ToggleDiagnostics()
				diagnostics_active = not diagnostics_active
				if diagnostics_active then
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						vim.diagnostic.show(nil, buf)
					end
					print("LSP Diagnostics Enabled Across Project")
				else
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						vim.diagnostic.hide(nil, buf)
					end
					print("LSP Diagnostics Disabled Across Project")
				end
			end

			-- Keymap to toggle diagnostics
			vim.keymap.set("n", "<leader>td", ToggleDiagnostics, { desc = "Toggle Diagnostics" })
		end,
	},
}
