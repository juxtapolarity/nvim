-- ----------------------------------------------------------------------------
-- lualine configuration for Neovim
-- ----------------------------------------------------------------------------
local M = {}

function M.setup()
    -- ------------------------------------------------------------------------
    -- Custom theme
    -- ------------------------------------------------------------------------
    local theme = require("lualine.themes.auto")

    theme.normal.a.bg = "#7AA2F7"
    theme.insert.a.bg = "#E0AF68"
    theme.visual.a.bg = "#9ECE6A"
    theme.command.a.bg = "#ad60f4"

    -- ------------------------------------------------------------------------
    -- DAP status component
    -- ------------------------------------------------------------------------
    local dap_status = {
        function()
            local ok, dap = pcall(require, "dap")
            if ok and dap.session() then
                return " Debugging"
            end
            return ""
        end,
        color = { fg = "#61afef", gui = "bold" },
    }

    -- ------------------------------------------------------------------------
    -- Lualine setup
    -- ------------------------------------------------------------------------
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = theme,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                "branch",
                "diff",
                "diagnostics",
                {
                    function()
                        return require("arrow.statusline").text_for_statusline_with_icons()
                    end,
                    cond = function()
                        return require("arrow.statusline").is_on_arrow_file() ~= nil
                    end,
                },
            },
            lualine_c = { "filename", dap_status },
            lualine_x = {
                { "swenv", icon = "" },
                "encoding",
                "fileformat",
                "filetype",
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
    })
end

return M
