-- check if VSCode exists
if vim.g.vscode then
    return
end

local ok, gitsigns = pcall(require, 'gitsigns')

if ok then
    gitsigns.setup({ })

    -- keymaps
    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "preview hunk" })
    vim.keymap.set("n", "<leader>gj", ":Gitsigns next_hunk<CR>", { desc = "next hunk" })
    vim.keymap.set("n", "<leader>gk", ":Gitsigns prev_hunk<CR>", { desc = "prev hunk" })
    vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "blame line" })
end
