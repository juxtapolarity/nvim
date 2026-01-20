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

-- accept one word
-- local function SuggestOneCharacter()
--   local suggestion = vim.fn['copilot#Accept']("")
--   local bar = vim.fn['copilot#TextQueuedForInsertion']()
--   return bar:sub(1, 1)
-- end
--
-- local function SuggestOneWord()
--   local suggestion = vim.fn['copilot#Accept']("")
--   local bar = vim.fn['copilot#TextQueuedForInsertion']()
--   return vim.fn.split(bar,  [[[ .]\zs]])[1]
-- end
--
-- local map = vim.keymap.set
-- map('i', '<C-l>', SuggestOneCharacter, {expr = true, remap = false})
-- map('i', '<C-left>', SuggestOneWord, {expr = true, remap = false})
--
vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
