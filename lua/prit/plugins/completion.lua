return {
    'saghen/blink.cmp',
    version = '*', -- release tags ship a prebuilt fuzzy matcher
    event = "InsertEnter",
    opts = {
        -- <C-y> accept, <C-n>/<C-p> select, <C-space> open, <C-k> signature
        keymap = { preset = 'default' },
        completion = { documentation = { auto_show = true } },
        signature = { enabled = true },
        sources = { default = { 'lsp', 'path', 'buffer' } },
    },
}
