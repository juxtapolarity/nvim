-- ----------------------------------------------------------------------------
-- Filetype detection
-- ----------------------------------------------------------------------------
vim.filetype.add({
    pattern = {
        [".*%.jinja%.yaml"] = "jinja",
        [".*%.jinja%.yml"] = "jinja",
        [".*%.j2%.yaml"] = "jinja",
        [".*%.j2%.yml"] = "jinja",
    },
})

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
        if vim.bo.filetype == "python" or vim.bo.filetype == "jinja" then
            vim.opt_local.colorcolumn = "121"
        else
            vim.opt_local.colorcolumn = "80"
        end
    end,
})
