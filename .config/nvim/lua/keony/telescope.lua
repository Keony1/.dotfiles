local telescope = require('telescope.builtin')

vim.keymap.set("n", "<leader>ff", function() telescope.find_files() end)
vim.keymap.set("n", "<leader>fg", function () telescope.live_grep() end)
vim.keymap.set("n", "<leader>fb", function() telescope.buffers() end)
vim.keymap.set("n", "<leader>fh", function() telescope.help_tags() end)
