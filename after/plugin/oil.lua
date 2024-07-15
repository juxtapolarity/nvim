require("oil").setup()

-- keymaps
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
