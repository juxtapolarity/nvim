-- ----------------------------------------------------------------------------
-- swenv configuration for Neovim
-- ----------------------------------------------------------------------------
local M = {}

-- ----------------------------------------------------------------------------
-- Key mappings
-- ----------------------------------------------------------------------------
M.keys = {
    {
        "<leader>Cp",
        function()
            require("swenv.api").pick_venv()
        end,
        desc = "pick env [conda]",
    },
    {
        "<leader>Cs",
        function()
            require("swenv.api").get_current_venv()
        end,
        desc = "show current env",
    },
}

-- ----------------------------------------------------------------------------
-- Setup function
-- ----------------------------------------------------------------------------
function M.setup()
    require("swenv").setup({
        notification = false,
    })
end

return M
