-- This file can be loaded by calling `lua require('juls.lazy')` from your init.lua

-- Ensure lazy.nvim is available
vim.cmd [[packadd lazy.nvim]]

local lazy = require('lazy')

lazy.setup({
    -- Packer can manage itself
    -- 'wbthomason/packer.nvim',

    -- fuzzy finder
    {'nvim-lua/plenary.nvim', lazy = true},
    {'nvim-lua/popup.nvim', lazy = true},
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
        config = function()
            require('telescope').setup()
            require('telescope').load_extension('dap')
        end,
    },

    -- treesitter: syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        event = 'BufRead',
    },
    { 'nvim-treesitter/playground', dependencies = 'nvim-treesitter/nvim-treesitter' },
    { "nvim-treesitter/nvim-treesitter-textobjects", dependencies = "nvim-treesitter/nvim-treesitter" },

    -- quick file access
    {'theprimeagen/harpoon', module = "harpoon"},

    -- undo history
    { 'mbbill/undotree', cmd = "UndotreeToggle" },
    { 'tpope/vim-fugitive', cmd = "Git" },


    -- comments
    { 'numToStr/Comment.nvim', event = "BufRead" },
    { 'JoosepAlviste/nvim-ts-context-commentstring', dependencies = 'nvim-treesitter/nvim-treesitter' },

    -- toggle terminal
    {
        "akinsho/toggleterm.nvim",
        branch = 'main',
        cmd = { "ToggleTerm", "TermExec" },
    },

    -- -- debugging
    { 'nvim-telescope/telescope-dap.nvim', dependencies = 'nvim-telescope/telescope.nvim'},
    { 'mfussenegger/nvim-dap', event = "BufReadPre" },
    { 
        "rcarriga/nvim-dap-ui",
        dependencies = 'mfussenegger/nvim-dap',
        config = function()
            require('dapui').setup()
        end,
    },
    { 
        'mfussenegger/nvim-dap-python',
        dependencies = 'mfussenegger/nvim-dap',
        config = function()
            require('dap-python').setup()
        end,
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = 'mfussenegger/nvim-dap',
        config = function()
            require('nvim-dap-virtual-text').setup()
        end,
    },

    -- key binder reminding mechanism
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    -- "folke/which-key.nvim",
    -- {
    --     "folke/which-key.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("which-key").setup({
    --             -- You can add any configuration options for which-key here
    --         })
    --     end,
    -- },

    -- -- git signs
    -- { 'lewis6991/gitsigns.nvim', event = "BufRead",
    --    config = function()
    --        require('gitsigns').setup({ e
    --            -- your gitsigns configuration
    --        })
    --    end, },
    --
    -- -- cmp plugins
    -- 'hrsh7th/cmp-nvim-lsp',
    -- 'hrsh7th/cmp-buffer',
    -- 'hrsh7th/cmp-path',
    -- 'hrsh7th/cmp-cmdline',
    -- 'hrsh7th/nvim-cmp',
    -- 'hrsh7th/cmp-nvim-lsp-signature-help',

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
    --
    -- -- hop
    -- { "smoka7/hop.nvim", branch = 'main' },
    --
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
    -- -- lsp 
    -- 'neovim/nvim-lspconfig',
    -- { 'williamboman/mason.nvim', run = ":MasonUpdate" },
    -- 'williamboman/mason-lspconfig.nvim',
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
    {"folke/zen-mode.nvim", cmd = "ZenMode"},

    -- GitHub Copilot
    'github/copilot.vim'
})
