return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = "Telescope",
    keys = {
        { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Git files" },
        { "<leader>ps", function()
            require('telescope.builtin').grep_string{
                search = vim.fn.input("Grep > ")
            }
        end, desc = "Grep string" },
        { "<leader>pg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        { "<leader>pb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>pd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
        { "<leader>vh", "<cmd>Telescope help_tags<cr>", desc = "Vim help" },
    },
}
