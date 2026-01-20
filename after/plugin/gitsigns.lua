-- check if VSCode exists
if vim.g.vscode then
    return
end

local ok, gitsigns = pcall(require, 'gitsigns')

if ok then
    gitsigns.setup({ })

    -- keymaps
    vim.keymap.set("n", "<leader>Gp", ":Gitsigns preview_hunk<CR>", { desc = "preview hunk" })
    vim.keymap.set("n", "<leader>Gj", ":Gitsigns next_hunk<CR>", { desc = "next hunk" })
    vim.keymap.set("n", "<leader>Gk", ":Gitsigns prev_hunk<CR>", { desc = "prev hunk" })
    vim.keymap.set("n", "<leader>Gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "blame line" })
end
