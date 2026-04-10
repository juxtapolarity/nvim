-- ----------------------------------------------------------------------------
-- tokyogogh configuration
-- ----------------------------------------------------------------------------
local M = {}

-- ----------------------------------------------------------------------------
-- Setup function
-- ----------------------------------------------------------------------------
function M.setup()
    require("tokyogogh").setup({
        style = "night",
        term_colors = true,

        code_styles = {
            strings = { italic = false, bold = false },
            comments = { italic = true, bold = false },
            functions = { italic = false, bold = false },
            variables = { italic = false, bold = false },
        },

        diagnostics = {
            undercurl = true,
            background = true,
        },

        colors = {},
        highlights = {},
    })
end

return M
