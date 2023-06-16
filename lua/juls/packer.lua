-- This fil can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- fuzzy finder
    use('nvim-lua/plenary.nvim')
    use{'nvim-telescope/telescope.nvim', tag = '0.1.1'}
    use('nvim-lua/popup.nvim')

    -- syntax highlighting
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    -- quick file access
    use('theprimeagen/harpoon')

    -- undo history
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    -- treesitter: additional functionality
    use("nvim-treesitter/nvim-treesitter-textobjects")

    -- comments
    use('numToStr/Comment.nvim')
    use('JoosepAlviste/nvim-ts-context-commentstring')

    -- toggle terminal
    use{"akinsho/toggleterm.nvim", tag = '*'}

    -- debugging
    use('nvim-telescope/telescope-dap.nvim')
    use('mfussenegger/nvim-dap')
    use("rcarriga/nvim-dap-ui")
    use('mfussenegger/nvim-dap-python')
    use('theHamsta/nvim-dap-virtual-text')

    -- key binder reminding mechanism
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- git signs
    use {'lewis6991/gitsigns.nvim'}

    -- cmp plugins
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp-signature-help')

    -- file explorer
    use('nvim-tree/nvim-web-devicons')
    use('nvim-tree/nvim-tree.lua')

    -- trouble (diagnostics, errors, etc.)
    use('folke/trouble.nvim')

    -- transparent
    use('xiyaowong/transparent.nvim')

    -- lualine
    use('nvim-lualine/lualine.nvim')

    -- change conda env from within neovim
    use('AckslD/swenv.nvim')
    use('stevearc/dressing.nvim')

    -- easy escape - remap of escape key
    use("zhou13/vim-easyescape")

    -- add/delete/change surrounding pairs
    use{"kylechui/nvim-surround", tag = "*"}

    -- snippets
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')
    use('rafamadriz/friendly-snippets')

    -- type checking
    use("folke/neodev.nvim")

    -- lsp 
    use('neovim/nvim-lspconfig')
    use{'williamboman/mason.nvim', run = ":MasonUpdate"}
    use('williamboman/mason-lspconfig.nvim')

    -- linting and formatting
    use('jose-elias-alvarez/null-ls.nvim')

    -- python testing
    use("nvim-neotest/neotest")
    use("nvim-neotest/neotest-python")

    -- distant (ssh connection)
    use{'chipsenkbeil/distant.nvim', branch = 'v0.2'}
end)
