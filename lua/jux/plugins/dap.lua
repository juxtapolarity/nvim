-- ----------------------------------------------------------------------------
-- Highlight/sign definitions
-- ----------------------------------------------------------------------------

-- Get the background color of the SignColumn highlight group to use for DAP
-- signs.
vim.cmd("TransparentDisable")
local sign_column_hl = vim.api.nvim_get_hl(0, { name = 'SignColumn' })
local sign_column_bg = (sign_column_hl.bg ~= nil) and ('#%06x'):format(sign_column_hl.bg) or 'bg'
local sign_column_ctermbg = (sign_column_hl.ctermbg ~= nil) and sign_column_hl.ctermbg or 'Black'
vim.cmd("TransparentEnable")

-- Define custom highlight groups for DAP signs using the retrieved background color
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg=sign_column_ctermbg, fg = '#993939', bg = yellow })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = sign_column_ctermbg, fg = '#98c379', bg = sign_column_bg })
vim.api.nvim_set_hl(0, 'DapCurrentLineBg', { ctermbg = 'darkgrey', bg = '#2c313c' })

-- Define DAP signs with the custom highlight groups
vim.fn.sign_define('DapBreakpoint', { text=' ', texthl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text=' ', texthl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text=' ', texthl='DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text=' ', texthl='DapLogPoint' })
vim.fn.sign_define('DapStopped', { text=' ', texthl='DapStopped', linehl='DapCurrentLineBg'})

