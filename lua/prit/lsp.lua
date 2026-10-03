-- Nvim 0.11+ already maps: K hover, grn rename, gra code action,
-- grr references, gri implementation, [d / ]d next/prev diagnostic.
vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = { border = "rounded", source = true },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = desc })
        end
        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("<leader>e", vim.diagnostic.open_float, "Show diagnostic")
        map("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format file")
        map("<leader>ih", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
        end, "Toggle inlay hints")

        -- inlay hints show inferred types, very useful while learning Rust
        vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = function() vim.lsp.buf.format({ async = false }) end,
})
