-- check if VSCode exists
if vim.g.vscode then
    return
end

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "undotree" })
