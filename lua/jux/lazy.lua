-- This file can be loaded by calling `lua require('juls.lazy')` from your init.lua

-- ----------------------------------------------------------------------------
-- Bootstrap
-- ---------------------------------------------------------------------------
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy.nvim
local lazy = require('lazy')

-- ============================================================================
-- Load plugins with lazy.nvim
-- ============================================================================
lazy.setup({

    -- ------------------------------------------------------------------------
    -- Colorscheme
    -- ------------------------------------------------------------------------

    -- tokyonight gogh theme
    { 
        'cesaralvarod/tokyogogh.nvim',
        lazy=false,
        priority=1000, 
        config = function()
            vim.cmd.colorscheme("tokyogogh")
        end,
    },

    ---------------------------------------------------------------------------
    -- Transparent background
    ---------------------------------------------------------------------------

    -- transparent
    {
        'xiyaowong/transparent.nvim',
        config = function()
            require("jux.plugins.transparent")
        end,
    },
    --
    -- ------------------------------------------------------------------------
    -- Zen mode
    -- ------------------------------------------------------------------------

    -- zen mode
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        keys = function()
            return require("jux.plugins.zen_mode").keys
        end,
        config = function()
            require("jux.plugins.zen_mode").setup()
        end,
    },
    --
    -- ------------------------------------------------------------------------
    -- Keybindings: reminder
    -- ------------------------------------------------------------------------

    -- which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("jux.plugins.which_key").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- Statusline
    -- ------------------------------------------------------------------------

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("jux.plugins.lualine").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- Git
    -- ------------------------------------------------------------------------

    -- gitsigns
    {
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("jux.plugins.gitsigns").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- Comments
    -- ------------------------------------------------------------------------
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("jux.plugins.comment").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- Code formatting
    -- ------------------------------------------------------------------------

    -- nvim-surround
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("jux.plugins.nvim_surround").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- File explorer
    -- ------------------------------------------------------------------------
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        keys = function()
            return require("jux.plugins.oil").keys
        end,
        config = function()
            require("jux.plugins.oil").setup()
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- ------------------------------------------------------------------------
    -- Navigation
    -- ------------------------------------------------------------------------

    -- hop
    {
        "smoka7/hop.nvim",
        cmd = { "HopWord", "HopChar1" },
        keys = function()
            return require("jux.plugins.hop").keys
        end,
        config = function()
            require("jux.plugins.hop").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- Buffer management
    -- ------------------------------------------------------------------------

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        tag = "0.1.8",
        keys = function()
            return require("jux.plugins.telescope").keys
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
        },
        config = function()
            require("jux.plugins.telescope").setup()
        end,
    },

    -- arrow
    {
        "otavioschwanck/arrow.nvim",
        event = "VeryLazy",
        config = function()
            require("jux.plugins.arrow").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- Treesitter and syntax highlighting
    -- ------------------------------------------------------------------------

    -- treesitter: syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("jux.plugins.treesitter").setup()
        end,
    },

    -- treesitter: playground and textobjects
    {
        'nvim-treesitter/playground',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        cmd = 'TSPlaygroundToggle'
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = 'BufRead'
    },

    -- ------------------------------------------------------------------------
    -- undo history
    -- ------------------------------------------------------------------------
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = function()
            return require("jux.plugins.undotree").keys
        end,
    },


    -- ------------------------------------------------------------------------
    -- Obsidian
    -- ------------------------------------------------------------------------

    -- obsidian.nvim
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        cond = function()
            return require("jux.plugins.obsidian").is_available()
        end,
        keys = function()
            return require("jux.plugins.obsidian").keys
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("jux.plugins.obsidian").setup()
        end,
    },


    -- ------------------------------------------------------------------------
    -- GitHub Copilot
    -- ------------------------------------------------------------------------
    -- On Windows, requires:
    -- $env:NODE_OPTIONS="--experimental-sqlite"

    -- copilot.vim
    {
        "github/copilot.vim",
        lazy = false,
        config = function()
            require("jux.plugins.copilot").setup()
        end,
    },
    -- git
    { 'tpope/vim-fugitive', cmd = "Git" },

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
    { "rcarriga/cmp-dap" },
    { "mfussenegger/nvim-dap-python" },
    { "theHamsta/nvim-dap-virtual-text" },

    -- comments
    { 'JoosepAlviste/nvim-ts-context-commentstring', dependencies = 'nvim-treesitter/nvim-treesitter', event = 'BufRead' },

    -- lsp 
    {
      'williamboman/mason.nvim',
      lazy = false,
      build = ':MasonUpdate',
    },

    -- cmp plugins
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    -- {
    -- 'L3MON4D3/LuaSnip',
    -- lazy = false, -- Force LuaSnip to load immediately
    -- },
    -- {
    --     'saadparwaiz1/cmp_luasnip',
    --     lazy = false, -- Load immediately to ensure cmp_luasnip initializes after LuaSnip
    --     dependencies = { 'L3MON4D3/LuaSnip' },
    -- },
    -- {
    --     'hrsh7th/nvim-cmp',
    --     lazy = false, -- Load nvim-cmp immediately after LuaSnip and cmp_luasnip
    --     dependencies = {
    --         'L3MON4D3/LuaSnip',
    --         'saadparwaiz1/cmp_luasnip',
    --     },
    -- },
    -- {
    --     'hrsh7th/cmp-nvim-lsp',
    --     lazy = true, -- These plugins can load lazily as they don’t need to initialize first
    --     dependencies = { 'hrsh7th/nvim-cmp' },
    -- },
    -- {
    --     'hrsh7th/cmp-buffer',
    --     lazy = true,
    --     dependencies = { 'hrsh7th/nvim-cmp' },
    -- },
    -- {
    --     'hrsh7th/cmp-path',
    --     lazy = true,
    --     dependencies = { 'hrsh7th/nvim-cmp' },
    -- },
    -- {
    --     'hrsh7th/cmp-cmdline',
    --     lazy = true,
    --     dependencies = { 'hrsh7th/nvim-cmp' },
    -- },
    -- {
    --     'hrsh7th/cmp-nvim-lsp-signature-help',
    --     lazy = true,
    --     dependencies = { 'hrsh7th/nvim-cmp' },
    -- },

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



    -- {
    --   'nvimdev/dashboard-nvim',
    --   -- event = 'VimEnter',
    --   -- config = function()
    --   --   require('dashboard').setup {
    --   --     -- config
    --   --   }
    --   -- end,
    --   dependencies = { {'nvim-tree/nvim-web-devicons'}}
    -- },

    {
        "MaximilianLloyd/ascii.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },

    -- multiline cursors
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
    },

    -- tmux navigator
    { "alexghergh/nvim-tmux-navigation" },

    -- projects
    -- { "ahmedkhalf/project.nvim" },

    {
      "pappasam/nvim-repl",
    },

    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
      end
    }
    -- {
    -- 'MeanderingProgrammer/render-markdown.nvim',
    --     dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    --     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    --     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    --     ---@module 'render-markdown'
    --     ---@type render.md.UserConfig
    --     opts = {},
    -- }
})

