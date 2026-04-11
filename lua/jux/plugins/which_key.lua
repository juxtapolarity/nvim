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
        { "<leader>c", group = "diagnostics" },
        { "<leader>f", group = "telescope" },
        { "<leader>G", group = "git" },
        { "<leader>o", group = "obsidian" },
        { "<leader>T", group = "trouble" },
        { "<leader><leader>", group = "hop" },
        { "<leader>C", group = "virtual env" },
    })
end

return M
