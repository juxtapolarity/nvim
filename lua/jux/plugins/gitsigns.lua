-- ----------------------------------------------------------------------------
-- gitsigns configuration for Neovim
-- ----------------------------------------------------------------------------
local M = {}

-- ----------------------------------------------------------------------------
-- Setup function
-- ----------------------------------------------------------------------------
function M.setup()
    local gitsigns = require("gitsigns")

    -- Load the plugin with default options
    gitsigns.setup({})

    -- ------------------------------------------------------------------------
    -- Keybindings
    -- ------------------------------------------------------------------------
    vim.keymap.set("n", "<leader>Gp", "<cmd>Gitsigns preview_hunk<CR>", {
        desc = "preview hunk",
    })
    vim.keymap.set("n", "<leader>Gj", "<cmd>Gitsigns next_hunk<CR>", {
        desc = "next hunk",
    })
    vim.keymap.set("n", "<leader>Gk", "<cmd>Gitsigns prev_hunk<CR>", {
        desc = "prev hunk",
    })
    vim.keymap.set("n", "<leader>Gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", {
        desc = "blame line",
    })
end

return M
