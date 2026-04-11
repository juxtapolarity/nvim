local M = {}

function M.setup()
    local nav = require("nvim-tmux-navigation")

    nav.setup({
        disable_when_zoomed = true,
    })

    vim.keymap.set("n", "<C-h>", nav.NvimTmuxNavigateLeft, { desc = "tmux left" })
    vim.keymap.set("n", "<C-j>", nav.NvimTmuxNavigateDown, { desc = "tmux down" })
    vim.keymap.set("n", "<C-k>", nav.NvimTmuxNavigateUp, { desc = "tmux up" })
    vim.keymap.set("n", "<C-l>", nav.NvimTmuxNavigateRight, { desc = "tmux right" })
    vim.keymap.set("n", "<C-\\>", nav.NvimTmuxNavigateLastActive, { desc = "tmux last active" })
    vim.keymap.set("n", "<C-Space>", nav.NvimTmuxNavigateNext, { desc = "tmux next" })
end

return M
