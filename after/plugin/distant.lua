-- Check if VSCode exists
if vim.g.vscode then
    return
end

-- Ensure 'distant' is loaded before setting it up
vim.defer_fn(function()
    local ok, distant = pcall(require, 'distant')
    if ok then
        distant.setup {
            -- Applies Chip's personal settings to every machine you connect to
            --
            -- 1. Ensures that distant servers terminate with no connections
            -- 2. Provides navigation bindings for remote directories
            -- 3. Provides keybinding to jump into a remote file's parent directory
            ['*'] = require('distant.settings').chip_default()
        }
    else
        vim.notify('Failed to load distant.nvim', vim.log.levels.ERROR)
    end
end, 0)

