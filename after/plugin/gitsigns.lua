if vim.g.vscode then
    return
end

vim.defer_fn(function()
    local ok, gitsigns = pcall(require, 'gitsigns')
    if ok then
        gitsigns.setup({
            -- your gitsigns configuration
        })
    else
        vim.notify('Failed to load gitsigns.nvim', vim.log.levels.ERROR)
    end
end, 0)

