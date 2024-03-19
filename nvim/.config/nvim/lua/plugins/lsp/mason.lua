return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        init = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local mason_tool_installer = require("mason-tool-installer")

            mason.setup()
            mason_lspconfig.setup({
                ensure_installed = {
                    "clangd",
                    "tsserver",
                    "lua_ls",
                    "jdtls",
                    "rust_analyzer",
                    "html",
                    "jsonls",
                },
                automatic_instaltion = true,
            })

            mason_tool_installer.setup({
                ensure_installed = {
                    "prettier",
                    "stylua",
                    "eslint_d",
                },
            })
        end,
    },
}
