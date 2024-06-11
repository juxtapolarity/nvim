-- local username = os.getenv("USERNAME")
require("juls")

if vim.g.vscode then
else
    -- Equivalent to 'syntax enable'
    vim.cmd('syntax enable')

    -- Equivalent to 'set runtimepath+=~/.vim/colors/tokyonight-vim'
    vim.opt.runtimepath:append("~/AppData/Local/nvim/colors/tokyonight-vim")
    -- vim.opt.runtimepath:append(vim.fn.stdpath('config') .. '\\colors\\tokyonight-vim')

    -- Equivalent to 'set termguicolors'
    vim.opt.termguicolors = true

    -- Equivalent to 'let g:tokyonight_style = 'night'
    vim.g.tokyonight_style = 'night'

    -- Equivalent to 'let g:tokyonight_enable_italic = 0'
    vim.g.tokyonight_enable_italic = 0

    -- Equivalent to 'colorscheme tokyonight'
    vim.cmd('colorscheme tokyonight')
end

-- Load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/site/pack/lazy/start/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("juls.lazy")
