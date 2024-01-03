return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr
            vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
            -- vim.keymap.set("n","gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n","gd", "<cmd>Telescope lsp_definitions<CR>", opts)
            vim.keymap.set("n","gi", "<cmd>Telescope lsp_implementations<CR>", opts)
            vim.keymap.set("n","gT", "<cmd>Telescope lsp_type_definitions<CR>", opts)
            vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n","K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n","<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n","<leader>vd", function() vim.diagnostic.open_float() end, opts)
            -- vim.keymap.set("n","<leader>fmt", function() vim.lsp.buf.formatting() end, opts)
            vim.keymap.set("n","<leader>fmt", vim.cmd.Neoformat, opts)
            vim.keymap.set("n","[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n","]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n","<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n","<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n","<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

          --  vim.keymap.set("n","gd", "<cmd> Telescope lsp_definitions<CR>", opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = { -- custom settings for lua
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                -- make language server aware of runtime files
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
            },
          },
        })


    end
}
