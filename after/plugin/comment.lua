vim.defer_fn(function()
    local ok, comment = pcall(require, 'Comment')
    if ok then
        comment.setup({
            toggler = {
                line = 'gcc',
                block = 'gbc',
            },
            opleader = {
                line = 'gc',
                block = 'gb',
            },
        })
    else
        vim.notify('Failed to load Comment.nvim', vim.log.levels.ERROR)
    end
end, 0)

