-- vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

-- reselect line after indentation
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Embrace vim: remap arrow keys
vim.keymap.set("n", "<Up>", "k", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "j", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", "h", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", "l", { noremap = true, silent = true })
vim.keymap.set("v", "<Up>", "k", { noremap = true, silent = true })
vim.keymap.set("v", "<Down>", "j", { noremap = true, silent = true })
vim.keymap.set("v", "<Left>", "h", { noremap = true, silent = true })
vim.keymap.set("v", "<Right>", "l", { noremap = true, silent = true })
vim.keymap.set("i", "<Up>", "<C-o>k", { noremap = true, silent = true })
vim.keymap.set("i", "<Down>", "<C-o>j", { noremap = true, silent = true })
vim.keymap.set("i", "<Left>", "<C-o>h", { noremap = true, silent = true })
vim.keymap.set("i", "<Right>", "<C-o>l", { noremap = true, silent = true })

-- Map Ctrl+direction to window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Map <leader>v to enter visual block mode
-- Map <leader>v to enter visual block mode
vim.keymap.set('n', '<leader>v', '<C-v>', { noremap = true, silent = true })


