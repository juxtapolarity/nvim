-- ----------------------------------------------------------------------------
-- Zen Mode configuration for Neovim
-- ----------------------------------------------------------------------------

local M = {}

-- ----------------------------------------------------------------------------
-- Keybindings for zen-mode.nvim
-- ----------------------------------------------------------------------------
M.keys = {
    { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
}

-- ----------------------------------------------------------------------------
-- Helper function: choose width by filetype
-- ----------------------------------------------------------------------------
local function zen_width()
    if vim.bo.filetype == "python" then
        return 131
    end
    return 100
end

-- ----------------------------------------------------------------------------
-- Setup function for zen-mode.nvim
-- ----------------------------------------------------------------------------
function M.setup()
    require("zen-mode").setup({
        window = {
            backdrop = 0.7,
            width = zen_width,
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
