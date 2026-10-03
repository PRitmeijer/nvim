return {
    {
        -- press <leader> and wait: shows every keymap you have
        'folke/which-key.nvim',
        event = "VeryLazy",
        opts = {
            icons = { mappings = false },
            spec = {
                { "<leader>p", group = "project/find" },
                { "<leader>r", group = "rust" },
                { "<leader>a", group = "claude" },
            },
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
    {
        -- <C-h/j/k/l> moves between nvim splits AND tmux panes
        'christoomey/vim-tmux-navigator',
        cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
        keys = {
            { "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
            { "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
            { "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
            { "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
        },
    },
}
