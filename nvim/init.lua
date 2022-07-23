require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'terrortylor/nvim-comment'
    use 'windwp/nvim-autopairs'
    use 'kyazdani42/nvim-tree.lua'

    use 'neovim/nvim-lspconfig'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/nvim-cmp'

    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)

require('boofexec')
require('keymaps')
require('settings')
require('statusline').setup()
require('tabline').setup()
require('autocmds')
require('plugins/lsp')
require('plugins/gitsigns')
require('plugins/autopairs')
require('plugins/treesitter')
require('plugins/telescope')
require('plugins/comment')
require('plugins/nvim-tree')
