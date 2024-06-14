-- check if VSCode exists
if vim.g.vscode then
    return
end

-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- -- empty setup using defaults
-- require("nvim-tree").setup()

-- keymaps
--vim.keymap.set('n', '<leader>e', nvim-tree-api.tree.toggle(), { desc = "File explorer" })
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
