return {
  {
    "nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
	lazy = vim.fn.argc(-1) == 0,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
	init = function(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "markdown",
          "markdown_inline",
          "bash",
          "lua",
		  "luadoc",
          "vim",
		  "vimdoc",
		  "php",
		  "regex",
          "gitignore",
          "query",
          "rust",
          "git_rebase",
          "fish",
          "go",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
}
