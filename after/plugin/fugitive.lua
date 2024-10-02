-- check if VSCode exists
if vim.g.vscode then
    return
end

vim.defer_fn(function()
    vim.keymap.set("n", "<leader>Gs", vim.cmd.Git, { desc = "Git status" })
end, 0)
