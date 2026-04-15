-- --------------------------------------------------------------
-- Treesitter configuration for Neovim
-- ----------------------------------------------------------------------------
local M = {}

-- ----------------------------------------------------------------------------
-- Setup function
-- ----------------------------------------------------------------------------
function M.setup()
    require("nvim-treesitter.configs").setup({

        -- Parsers to install
        ensure_installed = {
            "c",
            "lua",
            "jinja",
            "jinja_inline",
            "vim",
            "vimdoc",
            "query",
            "python",
            "markdown",
            "markdown_inline",
            "yaml",
        },

        sync_install = false,
        auto_install = true,
        ignore_install = { "javascript" },

        -- Features
        highlight = {
            enable = true,
            disable = function(_, buf)
                if vim.bo[buf].buftype ~= "" then return true end
                local max_filesize = 100 * 1024 -- 100 KB
                local path = vim.api.nvim_buf_get_name(buf)
                local uv = vim.uv or vim.loop
                local ok, stats = pcall(uv.fs_stat, path)
                return ok and stats and stats.size > max_filesize
            end,
            additional_vim_regex_highlighting = false,
        },
    })
end

return M
