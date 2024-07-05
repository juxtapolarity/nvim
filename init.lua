-- Get the username dynamically
local username = "jux"

-- Load user-specific configuration
local user_config_status, user_config_err = pcall(require, username)
if not user_config_status then
    print(string.format("Error loading user config: %s", user_config_err))
end

if vim.g.vscode then
else
    -- Equivalent to 'syntax enable'
    vim.cmd('syntax enable')

    if vim.fn.has('win32') == 1 then
        -- Windows specific runtime path
        vim.opt.runtimepath:append("~/AppData/Local/nvim/colors/tokyonight-vim")
    else
        -- Unix specific runtime path
        vim.opt.runtimepath:append("~/.config/nvim/colors/tokyonight-vim")
    end

    -- Equivalent to 'set termguicolors'
    vim.opt.termguicolors = true

    -- Equivalent to 'let g:tokyonight_style = 'night'
    vim.g.tokyonight_style = 'night'

    -- Equivalent to 'let g:tokyonight_enable_italic = 0'
    vim.g.tokyonight_enable_italic = 0

    -- Equivalent to 'colorscheme tokyonight'
    vim.cmd('colorscheme tokyonight')
end

-- Load lazy.nvim setup
require(username .. ".lazy")
