vim.keymap.set("n", "gs", vim.cmd.Git);
vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>")

vim.cmd("hi DiffAdd gui=NONE guifg=#98c379")
vim.cmd("hi DiffRemoved gui=NONE guifg=#e06c7R")
vim.cmd("hi DiffChanged gui=NONE guifg=#b3deef")


--hi diffRemoved guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
--hi diffChanged guifg=#b3deef ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
--hi diffAdded guifg=#c9d05c ctermfg=185 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
