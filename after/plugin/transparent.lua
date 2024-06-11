if vim.g.vscode then
    return
end

vim.defer_fn(function()
    local ok, transparent = pcall(require, 'transparent')
    if ok then
        transparent.setup({
            -- your transparent configuration
            -- enable = true, -- example configuration
            -- extra_groups = { -- example configuration
            --     "Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier", "Statement", "PreProc", "Type", "Underlined", "Todo", "String", "Function", "Conditional", "Repeat", "Operator", "Structure", "LineNr", "NonText", "SignColumn", "CursorLineNr", "EndOfBuffer",
            -- },
        })
        vim.notify('transparent setup complete', vim.log.levels.INFO)
    else
        vim.notify('Failed to load transparent', vim.log.levels.ERROR)
    end
end, 0)

