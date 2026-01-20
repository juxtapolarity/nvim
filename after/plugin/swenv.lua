-- check if VSCode exists
if vim.g.vscode then
    return
end

vim.defer_fn(function()
    local ok, swenv = pcall(require, 'swenv')
    if ok then
        swenv.setup({
            -- your swenv configuration
            notification = false,  -- Disable notification messages
        })

        vim.keymap.set('n', '<leader>Cp', function() require('swenv.api').pick_venv() end, { desc = "pick env [conda]" })
        vim.keymap.set('n', '<leader>Cs', function() require('swenv.api').get_current_venv() end, { desc = "show current env" })
    else
        vim.notify('Failed to load swenv', vim.log.levels.ERROR)
    end
end, 0)
