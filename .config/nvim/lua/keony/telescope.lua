local telescope = require('telescope.builtin')
local Remap = require("keony.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

-- nnoremap("<leader>ff", function() telescope.find_files() end)
-- nnoremap("<leader>fg", function() telescope.live_grep() end)
-- nnoremap("<leader>fb", function() telescope.buffers() end)
-- nnoremap("<leader>fh", function() telescope.help_tags() end)

vim.keymap.set("n", "<leader>ff", function() telescope.find_files() end)
vim.keymap.set("n", "<leader>fg", function () telescope.live_grep() end)
vim.keymap.set("n", "<leader>fb", function() telescope.buffers() end)
vim.keymap.set("n", "<leader>fh", function() telescope.help_tags() end)
