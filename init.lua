-- Get the username dynamically
local username = "jux"

-- Load user-specific configuration
local user_config_status, user_config_err = pcall(require, username)
if not user_config_status then
    print(string.format("Error loading user config: %s", user_config_err))
end

-- Load lazy.nvim setup
require(username .. ".lazy")

-- Define the colorscheme
local theme = "tokyogogh"
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

    if theme == "tokyogogh" then
        vim.cmd('colorscheme tokyogogh')

        -- Apply custom highlights
        vim.cmd([[highlight Function guifg=#ad60f4]])
        vim.cmd([[highlight Type guifg=#ad60f4]])
        vim.cmd([[highlight pythonDocstring guifg=#444B6A]])
        vim.cmd([[highlight String guifg=#ad8ee6]])
        vim.cmd([[highlight Identifier guifg=#E86F86]])

        -- Treesitter highlights for specific variables
        vim.cmd([[highlight @variable guifg=#E86F86]])
        vim.cmd([[highlight @namespace guifg=#E85349]])
        vim.cmd([[highlight @import guifg=#E85349]])

        -- custom colorcolumn color
        vim.cmd("highlight ColorColumn ctermbg=lightgrey guibg=#444B6A")
    else
        -- Equivalent to 'let g:tokyonight_style = 'night'
        vim.g.tokyonight_style = 'night'

        -- Equivalent to 'let g:tokyonight_enable_italic = 0'
        vim.g.tokyonight_enable_italic = 0

        -- Equivalent to 'colorscheme tokyonight'
        vim.cmd('colorscheme tokyonight')
    end
end

