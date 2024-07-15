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
        vim.cmd([[highlight Comment guifg=#444B6A]])
        -- vim.cmd([[highlight SpecialComment guifg=#444B6A]])
        -- vim.cmd([[highlight pythonDocstring guifg=#444B6A]])
        -- vim.cmd([[highlight @comment.documentation guifg=#444B6A]])
        vim.cmd([[highlight String guifg=#ad8ee6]])
        vim.cmd([[highlight Identifier guifg=#E86F86]])

        -- Treesitter highlights for specific variables
        vim.cmd([[highlight @variable guifg=#E86F86]])
        vim.cmd([[highlight @namespace guifg=#E85349]])
        vim.cmd([[highlight @import guifg=#E85349]])

        -- custom colorcolumn color
        vim.cmd("highlight ColorColumn ctermbg=lightgrey guibg=#444B6A")

        -- custom highlight for docstrings
        -- vim.cmd [[ highlight link @docstring Docstring ]]
        -- vim.cmd([[highlight Docstring guifg=#FF5733]])
    else
        -- Equivalent to 'let g:tokyonight_style = 'night'
        vim.g.tokyonight_style = 'night'

        -- Equivalent to 'let g:tokyonight_enable_italic = 0'
        vim.g.tokyonight_enable_italic = 0

        -- Equivalent to 'colorscheme tokyonight'
        vim.cmd('colorscheme tokyonight')
    end
end

-- markdown
vim.cmd([[
augroup markdown
  autocmd!
  autocmd FileType markdown setlocal textwidth=80
augroup END
]])

-- DAP
-- vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
-- Reuse current SignColumn background (except for DapStoppedLine)
local sign_column_hl = vim.api.nvim_get_hl(0, { name = 'SignColumn' })
local sign_column_bg = (sign_column_hl.bg ~= nil) and ('#%06x'):format(sign_column_hl.bg) or 'bg'
local sign_column_ctermbg = (sign_column_hl.ctermbg ~= nil) and sign_column_hl.ctermbg or 'Black'

-- vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg=lightgrey, fg = '#993939', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapCurrentLineBg', { ctermbg = 'darkgrey', bg = '#2c313c' })

vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg=sign_column_ctermbg, fg = '#993939', bg = yellow })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = sign_column_ctermbg, fg = '#98c379', bg = sign_column_bg })
vim.api.nvim_set_hl(0, 'DapCurrentLineBg', { ctermbg = 'darkgrey', bg = '#2c313c' })

-- vim.fn.sign_define('DapBreakpoint', { text=' ', texthl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpoint', { text=' ', texthl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text=' ', texthl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text=' ', texthl='DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text=' ', texthl='DapLogPoint' })
vim.fn.sign_define('DapStopped', { text=' ', texthl='DapStopped', linehl='DapCurrentLineBg'})

