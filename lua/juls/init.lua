-- -- local username = os.getenv("USERNAME")
-- local username = "juls"
-- require(username .. ".set")
-- require(username .. ".remap")
--
-- -- keybindings (VSCode)
-- if vim.g.vscode then
--     require(username .. ".vscodesettings")
-- else
--     -- keybindings (remap)
--     vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', {noremap = true, silent = true})
--     vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', {noremap = true, silent = true})
--     vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', {noremap = true, silent = true})
--     vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', {noremap = true, silent = true})
-- end
-- local username = os.getenv("USERNAME")
local username = "juls"

local ok, err = pcall(function() require(username .. ".set") end)
if not ok then print("Failed to load module: " .. username .. ".set", err) end

ok, err = pcall(function() require(username .. ".remap") end)
if not ok then print("Failed to load module: " .. username .. ".remap", err) end

-- keybindings (VSCode)
if vim.g.vscode then
    ok, err = pcall(function() require(username .. ".vscodesettings") end)
    if not ok then print("Failed to load module: " .. username .. ".vscodesettings", err) end
else
    -- keybindings (remap)
    vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', {noremap = true, silent = true})
end

