-- This file can be loaded by calling `lua require('juls.lazy')` from your init.lua

-- Ensure lazy.nvim is available
vim.cmd [[packadd lazy.nvim]]

local lazy = require('lazy')

lazy.setup({
    -- Packer can manage itself
    -- 'wbthomason/packer.nvim',

    -- fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        tag = '0.1.8',
        dependencies = { 
            { 'nvim-lua/plenary.nvim', lazy = true }, 
            { 'nvim-lua/popup.nvim', lazy = true },
            -- { 
            --     'nvim-telescope/telescope-dap.nvim', 
            --     cmd = "Telescope" 
            -- }
        },
        config = function()
            require('telescope').setup()
            -- require('telescope').load_extension('dap')
        end,
    },


    -- treesitter: syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        event = 'BufRead',
    },
    { 'nvim-treesitter/playground', dependencies = 'nvim-treesitter/nvim-treesitter', cmd = 'TSPlaygroundToggle' },
    { "nvim-treesitter/nvim-treesitter-textobjects", dependencies = "nvim-treesitter/nvim-treesitter", event = 'BufRead' },


    -- quick file access
    {'theprimeagen/harpoon', module = "harpoon"},

    -- undo history
    { 'mbbill/undotree', cmd = "UndotreeToggle" },
    { 'tpope/vim-fugitive', cmd = "Git" },


    -- comments
    { 'numToStr/Comment.nvim', event = "BufRead" },
    { 'JoosepAlviste/nvim-ts-context-commentstring', dependencies = 'nvim-treesitter/nvim-treesitter', event = 'BufRead' },


    -- toggle terminal
    {
        "akinsho/toggleterm.nvim",
        branch = 'main',
        cmd = { "ToggleTerm", "TermExec" },
    },

    -- debugging
    -- 'mfussenegger/nvim-dap',
    -- "rcarriga/nvim-dap-ui",
    -- 'mfussenegger/nvim-dap-python',
    -- 'theHamsta/nvim-dap-virtual-text',


    -- key binder reminding mechanism
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },

    -- git signs
    -- {
    --     'lewis6991/gitsigns.nvim',
    --     event = "VeryLazy",
    --     config = function()
    --         require('gitsigns').setup()
    --     end,
    -- },
    -- lsp 
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- cmp plugins
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp-signature-help',

    -- snippets
    'L3MON4D3/LuaSnip', -- Snippet engine
    'saadparwaiz1/cmp_luasnip', -- Snippet completion source
    'onsails/lspkind-nvim',
    -- {
    --     'hrsh7th/nvim-cmp',
    --     event = "InsertEnter",
    --     dependencies = {
    --         'hrsh7th/cmp-nvim-lsp',
    --         'hrsh7th/cmp-buffer',
    --         'hrsh7th/cmp-path',
    --         'hrsh7th/cmp-cmdline',
    --         'hrsh7th/cmp-nvim-lsp-signature-help',
    --         'L3MON4D3/LuaSnip', -- Snippet engine
    --         'saadparwaiz1/cmp_luasnip', -- Snippet completion source
    --     },
    -- },

    -- file explorer
    {'nvim-tree/nvim-web-devicons', lazy = true},
    {
        'nvim-tree/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        config = function()
            -- disable netrw before setting up nvim-tree
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- This configuration will be loaded when NvimTreeToggle is executed
            require("nvim-tree").setup()
        end,
    },

    -- -- trouble (diagnostics, errors, etc.)
    -- 'folke/trouble.nvim',
    --
    -- transparent
    {'xiyaowong/transparent.nvim', event='VeryLazy'},

    -- lualine
    {'nvim-lualine/lualine.nvim', event = "VeryLazy"},

    -- change conda env from within neovim
    {
        'AckslD/swenv.nvim',
        module = 'swenv',
        config = function()
            require('swenv').setup({
                -- your swenv configuration
                notification = false,  -- Disable notification messages
            })
        end,
    },
    { 'stevearc/dressing.nvim', event = 'VeryLazy' },
    --
    -- -- easy escape - remap of escape key
    -- -- "zhou13/vim-easyescape",

    -- hop
    "smoka7/hop.nvim",
    -- { "smoka7/hop.nvim", branch = 'main' },

    -- -- add/delete/change surrounding pairs
    -- { "kylechui/nvim-surround", branch = 'main' },
    --
    -- -- snippets
    -- 'L3MON4D3/LuaSnip',
    -- 'saadparwaiz1/cmp_luasnip',
    -- 'rafamadriz/friendly-snippets',
    --
    -- -- type checking
    -- "folke/neodev.nvim",
    --
    -- {
    --     'neovim/nvim-lspconfig',
    --     event = "BufReadPre",
    -- },
    -- {
    --     'williamboman/mason.nvim',
    --     run = ":MasonUpdate",
    --     event = "BufReadPre",
    -- },
    -- {
    --     'williamboman/mason-lspconfig.nvim',
    --     event = "BufReadPre",
    --     dependencies = { 'williamboman/mason.nvim' },
    -- },
    --
    -- -- linting and formatting
    -- 'jose-elias-alvarez/null-ls.nvim',
    --
    -- -- python testing
    -- "nvim-neotest/neotest",
    -- "nvim-neotest/neotest-python",
    --
    -- -- distant (ssh connection)
    -- {
    --     'chipsenkbeil/distant.nvim',
    --     branch = 'v0.2',
    --     event = "BufReadPre", -- Lazy load when opening a buffer
    -- },
    --
    -- Add nvim-nio dependency
    { 'nvim-neotest/nvim-nio' },

    -- zen mode
    -- {"folke/zen-mode.nvim", cmd = "ZenMode"},
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",  -- Load only when ZenMode command is calleo
        config = function()
            -- Configuration for zen-mode will be placed here
            require('zen-mode').setup({
                -- your zen-mode configuration
                window = {
                    width = .65 -- width will be 85% of the editor width
                }
            })
        end,
    },

    -- GitHub Copilot
    {
        'github/copilot.vim',
        event = "InsertEnter",
    },
})
