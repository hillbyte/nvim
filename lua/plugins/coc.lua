return {
	-- coc.nvim plugin
	{
		"neoclide/coc.nvim",
		branch = "release",
		config = function()
			-- Set up coc.nvim
			vim.cmd([[
        " Use <tab> for trigger completion and navigate to the next complete item
        inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
        inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

        " Use `[g` and `]g` to navigate diagnostics
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)

        " GoTo code navigation
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)

        " Use K to show documentation in preview window
        nnoremap <silent> K :call CocActionAsync('doHover')<CR>

        " Use <leader>rn to rename symbol
        nmap <leader>rn <Plug>(coc-rename)

        " Use <leader>f to format selected code
        xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)

        " Use <leader>a to fix current diagnostic
        nmap <leader>a  <Plug>(coc-codeaction-selected)
        xmap <leader>a  <Plug>(coc-codeaction-selected)

        " Use <leader>qf to fix all diagnostics
        nmap <leader>qf <Plug>(coc-fix-current)

        " Use <leader>e to show all diagnostics
        nmap <leader>e  :CocList diagnostics<CR>

        " Use <leader>o to show outline
        nmap <leader>o  :CocList outline<CR>

        " Use <leader>s to show symbols
        nmap <leader>s  :CocList symbols<CR>

        " Use <leader>j to jump to next diagnostic
        nmap <leader>j  :CocNext<CR>

        " Use <leader>k to jump to previous diagnostic
        nmap <leader>k  :CocPrev<CR>

        " Use <leader>p to show CocList
        nmap <leader>p  :CocList<CR>
      ]])

			-- Set up coc extensions
			vim.g.coc_global_extensions = {
				"coc-json",
				"coc-tsserver",
				"coc-html",
				"coc-css",
				"coc-pyright",
				"coc-eslint",
				"coc-prettier",
				"coc-snippets",
			}
		end,
	},
}
