return require('packer').startup(function(use)
    -- all things
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'sbdchd/neoformat'

    -- telescope
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }

    -- theme
    use 'folke/tokyonight.nvim'
     -- statusbar
    use 'feline-nvim/feline.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'kyazdani42/nvim-web-devicons'

   use {
       'VonHeikemen/lsp-zero.nvim',
       requires = {
           -- LSP Support
           {'neovim/nvim-lspconfig'},
           {'williamboman/mason.nvim'},
           {'williamboman/mason-lspconfig.nvim'},

           -- Autocompletion
           {'hrsh7th/nvim-cmp'},
           {'hrsh7th/cmp-buffer'},
           {'hrsh7th/cmp-path'},
           {'saadparwaiz1/cmp_luasnip'},
           {'hrsh7th/cmp-nvim-lsp'},
           {'hrsh7th/cmp-nvim-lua'},

           -- Snippets
           {'L3MON4D3/LuaSnip'},
           {'rafamadriz/friendly-snippets'},
       }
   }
   use {'simrat39/inlay-hints.nvim'}

   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
   -- use { 'nvim-treesitter/playground' }
   use 'romgrk/nvim-treesitter-context'
   use 'theprimeagen/harpoon'

   -- rust stuff
   use 'simrat39/rust-tools.nvim'

   -- Git 
   use 'tpope/vim-fugitive'
end)
