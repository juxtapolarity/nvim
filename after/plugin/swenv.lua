-- check if VSCode exists
if vim.g.vscode then
    return
end

vim.keymap.set('n', '<leader>cp', function() require('swenv.api').pick_venv() end, { desc = "pick env [conda]"})
vim.keymap.set('n', '<leader>cs', function() require('swenv.api').get_current_venv() end, { desc = "show current env "})
