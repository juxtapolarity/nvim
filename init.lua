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
  autocmd FileType markdown setlocal textwidth=79
augroup END
]])

-- DAP
-- vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
-- Reuse current SignColumn background (except for DapStoppedLine)
vim.cmd("TransparentDisable")
local sign_column_hl = vim.api.nvim_get_hl(0, { name = 'SignColumn' })
local sign_column_bg = (sign_column_hl.bg ~= nil) and ('#%06x'):format(sign_column_hl.bg) or 'bg'
local sign_column_ctermbg = (sign_column_hl.ctermbg ~= nil) and sign_column_hl.ctermbg or 'Black'
vim.cmd("TransparentEnable")

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

-- ----------------------------------------------------------------------------
-- Test: combinning stopped and breakpoint sign
-- ----------------------------------------------------------------------------
-- local dap = require('dap')
--
-- -- Define highlight and signs for combined stopped and breakpoint scenario
-- vim.api.nvim_set_hl(0, 'DapStoppedBreakpoint', { ctermbg = sign_column_ctermbg, fg = '#e06c75', bg = yellow })
-- vim.fn.sign_define('DapStoppedBreakpoint', { text = '', texthl = 'DapStoppedBreakpoint', linehl = 'DapCurrentLineBg' })
--
-- -- Function to update sign based on DAP stopped status and breakpoint
-- local function update_stopped_breakpoint_sign()
--     local session = require('dap').session()
--     if not session then
--         print("No active DAP session")
--         return
--     end
--
--     print("DAP session active, proceeding to list breakpoints")
--
--     -- Populate the quickfix list with breakpoints
--     require('dap').list_breakpoints()
--     print("Breakpoints listed in quickfix")
--
--     -- Wait a brief moment to ensure quickfix list is populated
--     vim.defer_fn(function()
--         -- Retrieve the current buffer and line
--         local buf = vim.api.nvim_get_current_buf()
--         local line = vim.fn.line('.')  -- 1-indexed for quickfix comparison
--
--         print("Current buffer ID:", buf, "Current line:", line)
--
--         -- Retrieve quickfix list items
--         local quickfix_items = vim.fn.getqflist()
--         if not quickfix_items or #quickfix_items == 0 then
--             print("Quickfix list is empty or not populated")
--             return
--         end
--
--         print("Quickfix list items:", vim.inspect(quickfix_items))
--
--         -- Check for a matching breakpoint in the quickfix list by buffer ID
--         local has_breakpoint = false
--         for _, item in ipairs(quickfix_items) do
--             print("Checking quickfix item - Buffer ID:", item.bufnr, "Line:", item.lnum)
--             if item.bufnr == buf and item.lnum == line then
--                 has_breakpoint = true
--                 print("Found matching breakpoint in quickfix list at line:", line)
--                 break
--             end
--         end
--
--         -- Clear any existing signs on this line using a unique ID
--         vim.fn.sign_unplace('DapSigns', { buffer = buf, id = line + 1000 })
--         print("Cleared existing signs on line:", line)
--
--         -- Place the correct sign based on breakpoint presence, using a unique ID
--         if has_breakpoint then
--             print("Placing DapStoppedBreakpoint sign on line:", line)
--             vim.fn.sign_place(line + 1000, 'DapSigns', 'DapStoppedBreakpoint', buf, { lnum = line })
--         else
--             print("Placing DapStopped sign on line:", line)
--             vim.fn.sign_place(line + 1000, 'DapSigns', 'DapStopped', buf, { lnum = line })
--         end
--     end, 50)  -- Adjust delay if needed for quickfix population
-- end
--
-- -- Listener to update the sign when DAP stops
-- dap.listeners.after.event_stopped["dap_stopped_breakpoint"] = function()
--     print("DAP stopped event triggered")
--     update_stopped_breakpoint_sign()
-- end
--
-- -- Optional: Clear the combined sign when DAP continues
-- dap.listeners.before.event_continued["clear_dap_stopped_breakpoint"] = function()
--     print("DAP continue event triggered, clearing DapStoppedBreakpoint signs")
--     vim.fn.sign_unplace('DapSigns', { buffer = vim.api.nvim_get_current_buf() })
-- end
