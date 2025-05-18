-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { {'nvim-lua/plenary.nvim'} },
		cmd = "Telescope",
		keys = {
			{"<leader>pf", "<cmd>Telescope find_files<cr>" },
			{"<C-p>", "<cmd>Telescope git_files<cr>" },
			{"<leader>ps", function()
				require('telescope.builtin').grep_string{
					search = vim.fn.input("Grep > ")
				}
			end},
		},
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		lazy = false,
		priority = 1000,
		opts = {
			disable_background = true,
		},
		config = function()
			local p = require('rose-pine.palette')
			vim.cmd.colorscheme('rose-pine')
			vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build   = ":TSUpdate",
		event   = { "BufReadPost", "BufNewFile" },
		config  = function()
			require("nvim-treesitter.configs").setup{
				ensure_installed = { "javascript","typescript","python","bash","dockerfile","markdown","markdown_inline" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			}
		end,
	},
})
