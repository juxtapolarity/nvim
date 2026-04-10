-- This file can be loaded by calling `lua require('juls.lazy')` from your init.lua

-- ----------------------------------------------------------------------------
-- Bootstrap
-- ---------------------------------------------------------------------------

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--branch=stable",
      lazyrepo,
      lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Load plugins with lazy.nvim
-- ============================================================================

-- Determine plugin sources based on OS
local is_windows = vim.fn.has("win32") == 1
local lazy_opts = {
    pkg = {
        enabled = true,
        sources = is_windows and { "lazy" } or { "lazy", "rockspec", "packspec" },
    },
}

-- Load lazy.nvim
local lazy = require('lazy')

lazy.setup({

    -- ------------------------------------------------------------------------
    -- Colorscheme
    -- ------------------------------------------------------------------------

    -- tokyonight gogh theme
    {
        "cesaralvarod/tokyogogh.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("jux.plugins.tokyogogh").setup()
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

    -- fugitive
    {
        "tpope/vim-fugitive",
        cmd = "Git",
        keys = function()
            return require("jux.plugins.fugitive").keys
        end,
    },

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
        keys = function()
            return require("jux.plugins.telescope").keys
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("jux.plugins.telescope").setup()
        end,
    },

    -- telescope-undo
    {
        "debugloop/telescope-undo.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        keys = function()
            return require("jux.plugins.telescope_undo").keys
        end,
        config = function()
            require("jux.plugins.telescope_undo").setup()
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

    -- undotree
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

    -- ------------------------------------------------------------------------
    -- Virtual environments
    -- ------------------------------------------------------------------------

    -- swenv
    {
        "AckslD/swenv.nvim",
        keys = function()
            return require("jux.plugins.swenv").keys
        end,
        config = function()
            require("jux.plugins.swenv").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- Auto-completion
    -- ------------------------------------------------------------------------

    -- cmp + sources
    {
        "hrsh7th/nvim-cmp",
        -- lazy = false,
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
        config = function()
            require("jux.plugins.cmp").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- Multicursor
    -- ------------------------------------------------------------------------
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        event = "VeryLazy",
        config = function()
            require("jux.plugins.multicursor").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- Dashboard
    -- ------------------------------------------------------------------------
    -- {
    --     "nvimdev/dashboard-nvim",
    --     event = "UIEnter",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     config = function()
    --         require("jux.plugins.dashboard").setup()
    --     end,
    -- },

    -- ------------------------------------------------------------------------
    -- LSP
    -- ------------------------------------------------------------------------
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("jux.plugins.lsp").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- TMUX <-> Neovim navigation
    -- ------------------------------------------------------------------------
    {
        "alexghergh/nvim-tmux-navigation",
        cond = function()
            return vim.fn.executable("tmux") == 1
        end,
        event = "VeryLazy",
        config = function()
            require("jux.plugins.nvim_tmux_navigator").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- DAP
    -- ------------------------------------------------------------------------

    -- nvim-dap
    {
        "mfussenegger/nvim-dap",
        keys = function()
            return require("jux.plugins.dap").keys
        end,
        config = function()
            require("jux.plugins.dap").setup()
        end,
    },

    -- nvim-dap-ui
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        keys = function()
            return require("jux.plugins.dap_ui").keys
        end,
        config = function()
            require("jux.plugins.dap_ui").setup()
        end,
    },

    -- nvim-dap-virtual-text
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        keys = function()
            return require("jux.plugins.dap_virtual_text").keys
        end,
        config = function()
            require("jux.plugins.dap_virtual_text").setup()
        end,
    },

    -- nvim-dap-python
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        keys = function()
            return require("jux.plugins.dap_python").keys
        end,
        config = function()
            require("jux.plugins.dap_python").setup()
        end,
    },

    -- cmp-dap
    {
        "rcarriga/cmp-dap",
        dependencies = {
            "mfussenegger/nvim-dap",
            "hrsh7th/nvim-cmp",
        },
        ft = { "dap-repl", "dapui_watches", "dapui_hover" },
    },

    -- telescope-dap
    {
        "nvim-telescope/telescope-dap.nvim",
        keys = function()
            return require("jux.plugins.telescope_dap").keys
        end,
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("jux.plugins.telescope_dap").setup()
        end,
    },

    -- ------------------------------------------------------------------------
    -- REPL
    -- ------------------------------------------------------------------------
    {
      "pappasam/nvim-repl",
    },

    -- comments
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        event = 'BufRead'
    },


    { 'stevearc/dressing.nvim', event = 'VeryLazy' },

    {
        "MaximilianLloyd/ascii.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },

}, lazy_opts)

