-- Check if VSCode exists
if vim.g.vscode then
    return
end

local zen_mode = require("zen-mode")

-- Set keymap for zen-mode
vim.keymap.set("n", "<leader>z", zen_mode.toggle, { desc = "Toggle Zen Mode" })
