return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup()

		vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { noremap = true, silent = true })
		vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { noremap = true, silent = true })
	end,
}
