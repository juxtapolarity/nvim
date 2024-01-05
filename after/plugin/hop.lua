require'hop'.setup {
  -- Hop configuration goes there
}

vim.keymap.set("n", "<leader><leader>w", "<cmd>HopWord<cr>",
  {silent = true, noremap = true, desc = "hop to lines"}
)
