-- This file can be loaded by calling `lua require('juls.lazy')` from your init.lua

-- Ensure lazy.nvim is available
-- vim.cmd [[packadd lazy.nvim]]

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Check if the required Obsidian directory exists
-- local obsidian_directory = "/home/jux/obsidian/juxnotes"
-- local obsidian_exists = vim.loop.fs_stat(obsidian_directory)

local lazy = require('lazy')

lazy.setup({

    -- fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        tag = '0.1.8',
        dependencies = {
            { 'nvim-lua/plenary.nvim', lazy = true },
            { 'nvim-lua/popup.nvim', lazy = true },
        },
        config = function()
            require('telescope').setup()
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

    -- git
    { 'tpope/vim-fugitive', cmd = "Git" },
    { 'lewis6991/gitsigns.nvim' },

    {
      "debugloop/telescope-undo.nvim",
      dependencies = { -- note how they're inverted to above example
        {
          "nvim-telescope/telescope.nvim",
          dependencies = { "nvim-lua/plenary.nvim" },
        },
      },
    },

    -- dap
    { 'nvim-telescope/telescope-dap.nvim' },
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    { "mfussenegger/nvim-dap-python" },
    { "theHamsta/nvim-dap-virtual-text" },

    -- comments
    { 'numToStr/Comment.nvim', event = "BufRead" },
    { 'JoosepAlviste/nvim-ts-context-commentstring', dependencies = 'nvim-treesitter/nvim-treesitter', event = 'BufRead' },

    -- toggle terminal
    {
        "akinsho/toggleterm.nvim",
        branch = 'main',
        cmd = { "ToggleTerm", "TermExec" },
    },

    -- key binder reminding mechanism
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },

    -- lsp 
    { 'neovim/nvim-lspconfig', event = { 'BufRead', 'BufNewFile' } },
    { 'williamboman/mason.nvim', run = ":MasonUpdate", event = { 'BufRead', 'BufNewFile' } },
    { 'williamboman/mason-lspconfig.nvim', event = { 'BufRead', 'BufNewFile' }, dependencies = { 'williamboman/mason.nvim' } },

    -- cmp plugins
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- file explorer
    {'nvim-tree/nvim-web-devicons', lazy = true},
    {
        'nvim-tree/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        config = function()
            -- disable netrw before setting up nvim-tree
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup()
        end,
    },

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
                notification = false,  -- Disable notification messages
            })
        end,
    },
    { 'stevearc/dressing.nvim', event = 'VeryLazy' },

    -- hop
    {
        "smoka7/hop.nvim",
        cmd = "HopWord",
        config = function()
            require('hop').setup()
        end,
    },

    -- zen mode
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            require('zen-mode').setup({
                window = {
                    width = .65 -- width will be 65% of the editor width
                }
            })
        end,
    },

    -- GitHub Copilot
    {
        'github/copilot.vim',
        event = "VeryLazy",
        cond = not vim.g.vscode,  -- Load Copilot only if not running in VSCode
    },

    {
      "epwalsh/obsidian.nvim",
      version = "*",  -- recommended, use latest release instead of latest commit
      lazy = true,
      ft = "markdown",
      -- event = {
      --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      --   "BufReadPre " .. vim.fn.expand "~" .. "obsidian/juxnotes/**.md",
      --   "BufNewFile " .. vim.fn.expand "~" .. "obsidian/juxnotes/**.md",
      -- },
      dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
      },
    },

    {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
          -- config
        }
      end,
      dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },

    {
        "MaximilianLloyd/ascii.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },


    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },


})

