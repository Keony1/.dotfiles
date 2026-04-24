return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = { noremap = true, silent = true }
		local on_attach = function(_, bufnr)
			opts.buffer = bufnr
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
			vim.keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", opts)
			vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)

			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set({ "n", "v" }, "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", opts)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- local servers = { 'clangd', 'tsserver', 'lua_ls' }
		vim.lsp.config("lua_ls", {
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
		vim.lsp.enable('lua_ls')

		vim.lsp.config("ts_ls", {
			--		capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("ts_ls")

		vim.lsp.config("clangd", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("clangd")

		vim.lsp.config("cssls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("cssls")

		vim.lsp.config("intelephense", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("intelephense")

		--	lspconfig['dprint'].setup({
		--		on_attach = on_attach,
		--	})
		--	--		-- format on save
		--	vim.api.nvim_create_autocmd("BufWritePre", {
		--		callback = function()
		--			vim.lsp.buf.format { async = false }
		--		end
		--;	})
		vim.keymap.set(
			"n",
			"<leader>fmt",
			"<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
