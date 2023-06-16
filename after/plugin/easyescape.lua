-- check if VSCode exists
if vim.g.vscode then
    return
end

-- Set global variables
vim.api.nvim_set_var('easyescape_chars', { j = 1, k = 1 })
vim.api.nvim_set_var('easyescape_timeout', 100)

-- Set key mappings
vim.api.nvim_set_keymap('c', 'jk', '<ESC>', {})
vim.api.nvim_set_keymap('c', 'kj', '<ESC>', {})
