vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File explorer" })

-- move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor centered when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over selection without losing the yanked text
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste keep register" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
