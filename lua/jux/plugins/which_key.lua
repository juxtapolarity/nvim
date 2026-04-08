-- ----------------------------------------------------------------------------
-- Which-Key configuration for Neovim
-- ----------------------------------------------------------------------------
local M = {}

-- ----------------------------------------------------------------------------
-- Setup function for which-key.nvim
-- ----------------------------------------------------------------------------
function M.setup()
    local wk = require("which-key")

    wk.setup({})

    wk.add({
        { "<leader>d", group = "debug" },
        { "<leader>f", group = "file" },
        { "<leader>G", group = "git" },
        { "<leader>h", group = "harpoon" },
        { "<leader>o", group = "obsidian" },
        { "<leader>T", group = "trouble" },
    })
end

return M
