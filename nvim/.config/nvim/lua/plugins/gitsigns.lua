return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({
            on_attach = function(bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }

                -- navigation
                vim.keymap.set("n", "]h", gitsigns.next_hunk, opts)
                vim.keymap.set("n", "[h", gitsigns.prev_hunk, opts)

                -- staging
                vim.keymap.set({ "n", "v" }, "<leader>hs", gitsigns.stage_hunk, opts)
                vim.keymap.set({ "n", "v" }, "<leader>hr", gitsigns.reset_hunk, opts)
                vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, opts)
                vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, opts)
                vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, opts)

                -- inspection
                vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, opts)
                vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, opts)
                vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, opts)
            end,
        })
    end,
}
