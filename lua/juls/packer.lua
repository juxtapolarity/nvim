-- This file can be loaded by calling `lua require('juls.lazy')` from your init.lua

-- Ensure lazy.nvim is available
vim.cmd [[packadd lazy.nvim]]

local lazy = require('lazy')

lazy.setup({
    -- Packer can manage itself
    { 'wbthomason/packer.nvim' },

    -- fuzzy finder
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.5' },
    { 'nvim-lua/popup.nvim' },

    -- syntax highlighting
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    { 'nvim-treesitter/playground' },

    -- quick file access
    { 'theprimeagen/harpoon' },

    -- undo history
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },

    -- treesitter: additional functionality
    { "nvim-treesitter/nvim-treesitter-textobjects" },

    -- comments
    { 'numToStr/Comment.nvim' },
    { 'JoosepAlviste/nvim-ts-context-commentstring' },

    -- toggle terminal
    { "akinsho/toggleterm.nvim", tag = '*' },

    -- debugging
    { 'nvim-telescope/telescope-dap.nvim' },
    { 'mfussenegger/nvim-dap' },
    { "rcarriga/nvim-dap-ui" },
    { 'mfussenegger/nvim-dap-python' },
    { 'theHamsta/nvim-dap-virtual-text' },

    -- key binder reminding mechanism
    {
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
    },

    -- git signs
    { 'lewis6991/gitsigns.nvim' },

    -- cmp plugins
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },

    -- file explorer
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-tree/nvim-tree.lua' },

    -- trouble (diagnostics, errors, etc.)
    { 'folke/trouble.nvim' },

    -- transparent
    { 'xiyaowong/transparent.nvim' },

    -- lualine
    { 'nvim-lualine/lualine.nvim' },

    -- change conda env from within neovim
    { 'AckslD/swenv.nvim' },
    { 'stevearc/dressing.nvim' },

    -- easy escape - remap of escape key
    { "zhou13/vim-easyescape" },

    { "smoka7/hop.nvim", tag = '*' },

    -- add/delete/change surrounding pairs
    { "kylechui/nvim-surround", tag = "*" },

    -- snippets
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'rafamadriz/friendly-snippets' },

    -- type checking
    { "folke/neodev.nvim" },

    -- lsp 
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim', run = ":MasonUpdate" },
    { 'williamboman/mason-lspconfig.nvim' },

    -- linting and formatting
    { 'jose-elias-alvarez/null-ls.nvim' },

    -- python testing
    { "nvim-neotest/neotest" },
    { "nvim-neotest/neotest-python" },

    -- distant (ssh connection)
    { 'chipsenkbeil/distant.nvim', branch = 'v0.2' },

    -- zen mode
    { "folke/zen-mode.nvim" },
})

