-- check if VSCode exists
if vim.g.vscode then
    return
end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "add" })
vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = "quick menu" })

vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = "goto #1" })
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = "goto #2" })
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = "goto #3" })
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = "goto #4" })
