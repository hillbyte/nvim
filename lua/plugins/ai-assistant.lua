return {
    {
        "supermaven-inc/supermaven-nvim",
        enabled = false,
        config = function()
            require("supermaven-nvim").setup({})
        end,
    },
    {
        "Exafunction/codeium.vim",
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        commit = "289eb724e5d6fab2263e94a1ad6e54afebefafb2",
        event = "BufEnter",
        config = function()
            vim.keymap.set("i", "<C-Space>", function()
                return vim.fn["codeium#Accept"]()
            end, { expr = true, silent = true })
        end,
    },
    {
        "codota/tabnine-nvim",
        enabled = false,
        build = "./dl_binaries.sh",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("tabnine").setup({
                disable_auto_comment = true,
                accept_keymap = "<Tab>",
                dismiss_keymap = "<C-]>",
                debounce_ms = 800,
                suggestion_color = { gui = "#808080", cterm = 244 },
                exclude_filetypes = { "TelescopePrompt" },
                log_file_path = nil, -- absolute path to Tabnine log file
            })
        end,
    },
}
