-- ----------------------------------------------------------------------------
-- markdown
-- ----------------------------------------------------------------------------
vim.cmd([[
augroup markdown
  autocmd!
  autocmd FileType markdown setlocal textwidth=79
augroup END
]])

