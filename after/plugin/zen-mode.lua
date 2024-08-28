-- Check if VSCode exists
if vim.g.vscode then
    return
end

local ok, zen_mode = pcall(require, 'zen-mode')
if ok then

    local opts = {
        window = {
            backdrop = .7,
            width = 100,
            -- width = .6,
        },
        plugins = {
            -- disable some global vim options (vim.o...)
            -- comment the lines to not apply the options
            options = {
              laststatus = 3, -- turn off the statusline in zen mode
            },
        },
    }
    zen_mode.setup(opts)

    -- Set keymap for zen-mode
    vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "Toggle Zen Mode" })

else
    vim.notify('Failed to load zen-mode', vim.log.levels.ERROR)
end
