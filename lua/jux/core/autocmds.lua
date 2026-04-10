-- ----------------------------------------------------------------------------
-- markdown
-- ----------------------------------------------------------------------------
vim.cmd([[
augroup markdown
  autocmd!
  autocmd FileType markdown setlocal textwidth=79
augroup END
]])


-- ----------------------------------------------------------------------------
-- Filetype-specific colorcolumn
-- ----------------------------------------------------------------------------
local colorcolumn_group = vim.api.nvim_create_augroup("jux_colorcolumn", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = colorcolumn_group,
    callback = function()
        if vim.bo.filetype == "python" then
            vim.opt_local.colorcolumn = "121"
        else
            vim.opt_local.colorcolumn = "80"
        end
    end,
})
