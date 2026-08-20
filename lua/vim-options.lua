vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=4")
vim.opt.clipboard = "unnamedplus"

--folding configuration start
--vim.cmd("set foldmethod=manual") -- Disable automatic folding by default Visual select then zf
--vim.cmd("set foldlevel=99") -- Ensure folds are open by default
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 102
vim.opt.foldnestmax = 5
-- fold conf end
-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive
--set cursorline
vim.opt.cursorline = true

vim.g.mapleader = " "
vim.g.background = "light"
vim.opt.swapfile = false

-- increment/decrement numbers by <C-a> and <C-x>

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
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

-- Save and quit
vim.keymap.set("i", "<leader>wq", "<CMD>wq!<CR>")

-- Quit
vim.keymap.set("n", "<leader>q", "<CMD>q!<CR>")

-- Exit insert mode.
vim.keymap.set("i", "ei", "<ESC>")

--Moving blocks

-- Insert mode
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
-- Normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
-- Visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- The `"+` register represents the system clipboard.
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[P]Yank to system clipboard" })

-- yank/copy to end of line
vim.keymap.set("n", "Y", "y$", { desc = "[P]Yank to end of line" })
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
