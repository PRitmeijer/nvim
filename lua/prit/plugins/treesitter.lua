return {
    "nvim-treesitter/nvim-treesitter",
    branch  = "master",
    build   = ":TSUpdate",
    event   = { "BufReadPost", "BufNewFile" },
    config  = function()
        require("nvim-treesitter.configs").setup{
            ensure_installed = {
                "rust", "toml", "lua", "vim", "vimdoc",
                "javascript", "typescript", "python", "bash", "dockerfile",
                "markdown", "markdown_inline",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end,
}
