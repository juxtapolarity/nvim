-- Check if VSCode exists
if vim.g.vscode then
    return
end

-- Copilot settings
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- vim.api.nvim_set_keymap("i", "<leader><Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Initialize Copilot
vim.cmd([[
    augroup copilot_init
        autocmd!
        autocmd InsertEnter * :Copilot enable
    augroup END
]])

-- Enable Copilot for gitcommit filetype
vim.cmd([[
    augroup copilot_commit_messages
        autocmd!
        autocmd FileType gitcommit let b:copilot_enabled = 1
    augroup END
]])

