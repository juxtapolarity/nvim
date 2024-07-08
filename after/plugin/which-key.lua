if vim.g.vscode then
    return
end

local ok, wk = pcall(require, "which-key")
if ok then
    wk.setup({})

    -- Minimal configuration to isolate the issue
    wk.register({
        d = { name = "debug" },
        f = { name = "file" },
        g = { name = "git" },
        h = { name = "harpoon" },
        o = { name = "obsidian" },
        T = { name = "trouble" },
    }, { prefix = "<leader>" })
else
    vim.notify('Failed to load which-key', vim.log.levels.ERROR)
end
