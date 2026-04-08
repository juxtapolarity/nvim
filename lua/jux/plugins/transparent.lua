-- ----------------------------------------------------------------------------
-- Transparent background for Neovim
-- ----------------------------------------------------------------------------

-- Check if the transparent plugin is available
local ok, transparent = pcall(require, "transparent")

-- If the plugin is not available, notify the user and return
if not ok then
    vim.notify("Failed to load transparent", vim.log.levels.ERROR)
    return
end

-- Run setup with default options
transparent.setup({})

-- Status message
vim.notify("transparent setup complete", vim.log.levels.INFO)
