return {
    {
        -- runs rust-analyzer for you (do not also set it up via lspconfig)
        'mrcjkb/rustaceanvim',
        lazy = false,
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(_, bufnr)
                        local map = function(keys, cmd, desc)
                            vim.keymap.set("n", keys, cmd, { buffer = bufnr, desc = desc })
                        end
                        map("<leader>rr", "<cmd>RustLsp runnables<cr>", "Rust: run")
                        map("<leader>rt", "<cmd>RustLsp testables<cr>", "Rust: test")
                        map("<leader>re", "<cmd>RustLsp explainError<cr>", "Rust: explain error")
                        map("<leader>rd", "<cmd>RustLsp renderDiagnostic<cr>", "Rust: full diagnostic")
                        map("<leader>rm", "<cmd>RustLsp expandMacro<cr>", "Rust: expand macro")
                        map("<leader>ro", "<cmd>RustLsp openDocs<cr>", "Rust: open docs.rs")
                        map("<leader>rc", "<cmd>RustLsp openCargo<cr>", "Rust: open Cargo.toml")
                    end,
                    default_settings = {
                        ['rust-analyzer'] = {
                            check = { command = "clippy" },
                        },
                    },
                },
            }
        end,
    },
    {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        opts = {
            completion = { crates = { enabled = true } },
            lsp = { enabled = true, actions = true, completion = true, hover = true },
        },
    },
}
