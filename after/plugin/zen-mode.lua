-- Check if VSCode exists
if vim.g.vscode then
    return
end

vim.defer_fn(function()
    local ok, zen_mode = pcall(require, 'zen-mode')
    if ok then
        -- Set keymap for zen-mode
        vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "Toggle Zen Mode" })
    else
        vim.notify('Failed to load zen-mode', vim.log.levels.ERROR)
    end
end, 0)
