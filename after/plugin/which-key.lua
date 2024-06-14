if vim.g.vscode then
    return
end

vim.defer_fn(function()
    local ok, wk = pcall(require, "which-key")
    if ok then
        wk.setup({})

        -- Minimal configuration to isolate the issue
        wk.register({
            f = { name = "file" },
            d = { name = "debug" },
            h = { name = "harpoon" },
            T = { name = "trouble" },
        }, { prefix = "<leader>" })
    else
        vim.notify('Failed to load which-key', vim.log.levels.ERROR)
    end
end, 0)
