-- Check if VSCode exists
-- if vim.g.vscode then
--     return
-- end

vim.defer_fn(function()
    local ok, comment = pcall(require, 'Comment')
    if ok then
        comment.setup()
    else
        vim.notify('Failed to load Comment.nvim', vim.log.levels.ERROR)
    end
end, 0)


