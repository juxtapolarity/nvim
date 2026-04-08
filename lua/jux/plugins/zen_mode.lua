-- ----------------------------------------------------------------------------
-- Zen Mode configuration for Neovim
-- ----------------------------------------------------------------------------

-- Create a module
local M = {}

-- ----------------------------------------------------------------------------
-- Keybindings for zen-mode.nvim
-- ----------------------------------------------------------------------------
M.keys = {
    { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
}

-- ----------------------------------------------------------------------------
-- Setup function for zen-mode.nvim
-- ----------------------------------------------------------------------------
function M.setup()
    require("zen-mode").setup({
        window = {
            backdrop = 0.7,
            width = 100,
        },
        plugins = {
            options = {
                laststatus = 3,
            },
        },
        on_open = function()
            -- placeholder for transparency fix
        end,
        on_close = function()
            -- placeholder for transparency fix
        end,
    })
end

return M
