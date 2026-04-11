-- ----------------------------------------------------------------------------
-- Copilot configuration
-- ----------------------------------------------------------------------------
local M = {}

-- ----------------------------------------------------------------------------
-- Setup function
-- ----------------------------------------------------------------------------
function M.setup()
    vim.g.copilot_no_tab_map = true

    -- ------------------------------------------------------------------------
    -- Keymaps
    -- ------------------------------------------------------------------------
    vim.keymap.set("i", "<Tab>", 'copilot#Accept("<CR>")', {
        expr = true,
        silent = true,
        replace_keycodes = false,
    })

    vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)")

    -- ------------------------------------------------------------------------
    -- Enable Copilot in gitcommit filetypes
    -- ------------------------------------------------------------------------
    local gitcommit_group = vim.api.nvim_create_augroup(
        "jux_copilot_gitcommit",
        { clear = true }
    )

    vim.api.nvim_create_autocmd("FileType", {
        group = gitcommit_group,
        pattern = "gitcommit",
        callback = function()
            vim.b.copilot_enabled = 1
        end,
    })
end

return M
