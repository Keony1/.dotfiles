return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				clang = { "clang_format" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({ async = false, lsp_fallback = true, timeout_ms = 500 })
		end)
	end,
	--	cmd = { "ConformInfo" },
	--	keys = {
	--		{
	--			"<leader>cf",
	--			function()
	--				require("conform").format({ async = true, lsp_fallback = true })
	--			end,
	--			mode = "",
	--			desc = "Format buffer",
	--		},
	--	},
	--	-- Everything in opts will be passed to setup()
	--	opts = {
	--		formatters_by_ft = {
	--			lua = { "stylua" },
	--			python = { "isort", "black" },
	--			javascript = { { "prettierd", "prettier" } },
	--		},
	--		format_on_save = { timeout_ms = 500, lsp_fallback = true },
	--		formatters = {
	--			shfmt = {
	--				prepend_args = { "-i", "2" },
	--			},
	--		},
	--	},
	--	init = function()
	--		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	--	end,
}
