return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
        defaults = {
            file_ignore_patterns = { "node_modules" },
        },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                file_ignore_patterns = { "node_modules", ".git" },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
        })
        telescope.load_extension("fzf")

        vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files<cr>")
        vim.keymap.set("n", "<leader>fg", "<cmd> Telescope live_grep<cr>")
        vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers<cr>")
        vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags<cr>")
    end,
}
