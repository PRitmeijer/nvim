-- Lets Claude Code see your open file / selection and show its edits as diffs.
-- Either toggle it here with <leader>ac, or run `claude` in a tmux pane and type /ide.
return {
    'coder/claudecode.nvim',
    lazy = false,
    opts = {
        terminal = { provider = "native", split_side = "right", split_width_percentage = 0.4 },
    },
    keys = {
        { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
        { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
        { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add buffer to Claude" },
        { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
        { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
        { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject Claude diff" },
    },
}
