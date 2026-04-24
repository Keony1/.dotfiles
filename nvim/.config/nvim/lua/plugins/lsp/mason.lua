return {
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
				"ts_ls",
				"lua_ls",
				"html",
				"jsonls",
				"cssls",
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"dprint",
				"eslint_d",
				"stylua",
			},
		})
	end,
}
