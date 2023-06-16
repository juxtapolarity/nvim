vim.api.nvim_set_keymap('n', '<leader>', ":call VSCodeNotify('whichkey.show')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>', ":call VSCodeNotify('whichkey.show')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>e', ":call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>e', ":call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>", {silent = true})


