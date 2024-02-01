local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	history = true,
	region_check_events = "InsertEnter",
	delete_check_events = "TextChanged,InserLeave",
	spec = {
		{
			"LazyVim/LazyVim",
			{ import = "lazyvim.plugins" },
			{ import = "lazyvim.plugins.extras.lang.typescript" },
			{ import = "lazyvim.plugins.extras.lang.java" },
			{ import = "lazyvim.plugins.extras.test.core" },
			{ import = "lazyvim.plugins.extras.dap.core" },
			{ import = "lazyvim.plugins.extras.linting.eslint" },
			{ import = "lazyvim.plugins.extras.formatting.prettier" },
		},
		{ import = "plugins" },
		{ import = "plugins.lsp" },
	},
	defaults = {
		lazy = false,
		version = false,
	},
	checker = { enabled = true },
})
