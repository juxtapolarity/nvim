local username = os.getenv("USERNAME")
require(username .. ".set")
require(username .. ".remap")

-- keybindings (remap)
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', {noremap = true, silent = true})

-- keybindings (VSCode)
if vim.g.vscode then
    require(username .. ".vscodesettings")
end
