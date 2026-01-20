require'hop'.setup {
  -- Hop configuration goes there
}

vim.keymap.set("n", "<leader><leader>w", "<cmd>HopWord<cr>", {silent = true, noremap = true, desc = "hop to lines"})
vim.keymap.set("n", "<leader><leader>c", "<cmd>HopChar1<cr>", {silent = true, noremap = true, desc = "hop to char"})
