vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

--folding configuration start
--vim.cmd("set foldmethod=manual") -- Disable automatic folding by default Visual select then zf
--vim.cmd("set foldlevel=99") -- Ensure folds are open by default
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 4
-- fold conf end

vim.g.mapleader = " "
vim.g.background = "light"
vim.opt.swapfile = false

-- New Windows
vim.keymap.set("n", "<leader>o", "<CMD>vsplit<CR>")
vim.keymap.set("n", "<leader>p", "<CMD>split<CR>")

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

-- Save
vim.keymap.set("n", "<leader>w", "<CMD>update<CR>")

-- Quit
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode.
vim.keymap.set("i", "jk", "<ESC>")

--Moving blocks

-- Normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
-- Visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Insert mode
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
