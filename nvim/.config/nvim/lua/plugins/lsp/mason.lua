return {
	{
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        init = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")

            mason.setup()
            mason_lspconfig.setup({
                ensure_installed = {
                    'tsserver',
                    'lua_ls',
                    'jdtls',
                    'rust_analyzer',
                    'html',
                    'jsonls',
                },
                automatic_instaltion = true,
            })
        end
	},
}