-- ----------------------------------------------------------------------------
-- Detect if Neovim was started with stdin
-- ----------------------------------------------------------------------------

vim.g.started_with_stdin = false

vim.api.nvim_create_autocmd("StdinReadPre", {
    callback = function()
        vim.g.started_with_stdin = true
    end,
})
