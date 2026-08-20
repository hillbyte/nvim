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
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
			if ok then
				capabilities = cmp_lsp.default_capabilities(capabilities)
			end

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				single_file_support = true,
			})

			vim.lsp.enable({ "lua_ls", "ts_ls" })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>cx", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

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

			vim.keymap.set("n", "<leader>td", ToggleDiagnostics, { desc = "Toggle Diagnostics" })
		end,
	},
}
