local telescope = require('telescope.builtin')
local Remap = require("keony.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

nnoremap("<leader>ff", function() telescope.find_files() end)
nnoremap("<leader>fg", function() telescope.live_grep() end)
nnoremap("<leader>fb", function() telescope.buffers() end)
nnoremap("<leader>fh", function() telescope.help_tags() end)
