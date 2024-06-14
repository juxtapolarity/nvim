if vim.g.vscode then
    return
end

vim.defer_fn(function()
    local ok, ts = pcall(require, 'nvim-treesitter.configs')
    if ok then
        ts.setup {
            ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "query" },
            sync_install = false,
            auto_install = false,  -- Disable automatic installation
            ignore_install = { "javascript" },
            highlight = {
                enable = true,
                disable = { "c", "rust" },
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },
            playground = {
                enable = true,
            },
        }
        vim.notify('nvim-treesitter setup complete', vim.log.levels.INFO)
    else
        vim.notify('Failed to load nvim-treesitter', vim.log.levels.ERROR)
    end
end, 0)
