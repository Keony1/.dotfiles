return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("trouble").setup()

		vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { noremap = true, silent = true })
	end,
}
