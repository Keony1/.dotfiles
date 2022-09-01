return require('packer').startup(function(use)
    -- all things
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'

    -- telescope
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }

    -- theme
    use 'folke/tokyonight.nvim'
     -- statusbar
    use { 'feline-nvim/feline.nvim', brach = '0.5-compat' }
    use 'lewis6991/gitsigns.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- lsp
    use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'onsails/lspkind-nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- rust stuff
    use 'simrat39/rust-tools.nvim'

    -- Git 
    use 'tpope/vim-fugitive'
end)
