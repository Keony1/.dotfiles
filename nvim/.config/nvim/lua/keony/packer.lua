return require('packer').startup(function(use)
    -- all things
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'
    use 'sbdchd/neoformat'

    -- telescope
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.4' }

    -- theme
    -- use { 'monsonjeremy/onedark.nvim', branch = 'treesitter' }
    use { 'folke/tokyonight.nvim'}

    -- statusbar
    -- use 'freddiehaddad/feline.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }
    use 'lewis6991/gitsigns.nvim'

    use {
        'VonHeikemen/lsp-zero.nvim',
         branch = 'v2.x',
         requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    -- java
    use 'mfussenegger/nvim-jdtls'

    -- DAP (Debug Adapter Protocol)
--    use {'mfussenegger/nvim-dap'}
--    use {'theHamsta/nvim-dap-virtual-text'}
--    use {'rcarriga/nvim-dap-ui'}
--
--    use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
--    use {
--      "microsoft/vscode-js-debug",
--      opt = true,
--      run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
--    }

--   use {
--    "williamboman/mason.nvim",
--    "mfussenegger/nvim-dap",
--    "jay-babu/mason-nvim-dap.nvim",
--   }

   use {'simrat39/inlay-hints.nvim'}

   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
   -- use { 'nvim-treesitter/playground' }
   use 'romgrk/nvim-treesitter-context'
   use 'theprimeagen/harpoon'

   -- rust stuff
   use 'simrat39/rust-tools.nvim'

   -- Git 
   use 'tpope/vim-fugitive'
   use 'mbbill/undotree'
end)
