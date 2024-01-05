vim.api.nvim_set_keymap('n', '<leader>', ":call VSCodeNotify('whichkey.show')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>', ":call VSCodeNotify('whichkey.show')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>e', ":call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>e', ":call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>", {silent = true})

-- harpoon
vim.api.nvim_set_keymap('n', '<leader>ha', ":call VSCodeNotify('vscode-harpoon.addEditor')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>ha', ":call VSCodeNotify('vscode-harpoon.addEditor')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>hm', ":call VSCodeNotify('vscode-harpoon.editEditors')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>hm', ":call VSCodeNotify('vscode-harpoon.editEditors')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>he', ":call VSCodeNotify('vscode-harpoon.editorQuickPick')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>he', ":call VSCodeNotify('vscode-harpoon.editorQuickPick')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>1', ":call VSCodeNotify('vscode-harpoon.gotoEditor1')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>1', ":call VSCodeNotify('vscode-harpoon.gotoEditor1')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>2', ":call VSCodeNotify('vscode-harpoon.gotoEditor2')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>2', ":call VSCodeNotify('vscode-harpoon.gotoEditor2')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>3', ":call VSCodeNotify('vscode-harpoon.gotoEditor3')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>3', ":call VSCodeNotify('vscode-harpoon.gotoEditor3')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>4', ":call VSCodeNotify('vscode-harpoon.gotoEditor4')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>4', ":call VSCodeNotify('vscode-harpoon.gotoEditor4')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>5', ":call VSCodeNotify('vscode-harpoon.gotoEditor5')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>5', ":call VSCodeNotify('vscode-harpoon.gotoEditor5')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>6', ":call VSCodeNotify('vscode-harpoon.gotoEditor6')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>6', ":call VSCodeNotify('vscode-harpoon.gotoEditor6')<CR>", {silent = true})

-- debugging
vim.api.nvim_set_keymap('n', '<leader>db', ":call VSCodeNotify('editor.debug.action.toggleBreakpoint')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>db', ":call VSCodeNotify('editor.debug.action.toggleBreakpoint')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>dj', ":call VSCodeNotify('workbench.action.debug.callStackDown')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>dj', ":call VSCodeNotify('workbench.action.debug.callStackDown')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>dk', ":call VSCodeNotify('workbench.action.debug.callStackUp')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>dk', ":call VSCodeNotify('workbench.action.debug.callStackUp')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>dw', ":call VSCodeNotify('workbench.debug.action.focusWatchView')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>dw', ":call VSCodeNotify('workbench.debug.action.focusWatchView')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>dw', ":call VSCodeNotify('workbench.debug.action.selectionToWatch')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>dw', ":call VSCodeNotify('workbench.debug.action.selectionToWatch')<CR>", {silent = true})

-- zen mode
vim.api.nvim_set_keymap('n', '<leader>z', ":call VSCodeNotify('workbench.action.toggleZenMode')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>z', ":call VSCodeNotify('workbench.action.toggleZenMode')<CR>", {silent = true})

-- telescope equivalent in vscode
vim.api.nvim_set_keymap('n', '<leader>ff', ":call VSCodeNotify('workbench.action.quickOpen')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>ff', ":call VSCodeNotify('workbench.action.quickOpen')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ":call VSCodeNotify('workbench.action.findInFiles')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>fg', ":call VSCodeNotify('workbench.action.findInFiles')<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>fe', ":call VSCodeNotify('workbench.action.expandSearchResults')<CR>", {silent = true})
vim.api.nvim_set_keymap('x', '<leader>fe', ":call VSCodeNotify('workbench.action.expandSearchResults')<CR>", {silent = true})

