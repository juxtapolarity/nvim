-- ----------------------------------------------------------------------------
-- nvim-dap-python configuration for Neovim
-- ----------------------------------------------------------------------------
local M = {}

local function get_python_path()
    local ok, swenv = pcall(require, "swenv.api")
    if ok then
        local venv = swenv.get_current_venv_path()
        if venv and venv ~= "" then
            if vim.fn.has("win32") == 1 then
                return venv .. "\\Scripts\\python.exe"
            end
            return venv .. "/bin/python"
        end
    end

    return "python"
end

-- ----------------------------------------------------------------------------
-- Key mappings
-- ----------------------------------------------------------------------------
M.keys = {
    {
        "<leader>dpt",
        function()
            require("dap-python").test_method()
        end,
        desc = "debug python test method",
    },
    {
        "<leader>dpc",
        function()
            require("dap-python").test_class()
        end,
        desc = "debug python test class",
    },
    {
        "<leader>dps",
        function()
            require("dap-python").debug_selection()
        end,
        mode = "v",
        desc = "debug python selection",
    },
    {
        "<leader>dpr",
        function()
            require("dap-python").setup(get_python_path())
            vim.notify("Refreshed dap-python interpreter", vim.log.levels.INFO)
        end,
        desc = "refresh dap-python interpreter",
    },
}

-- ----------------------------------------------------------------------------
-- Setup function
-- ----------------------------------------------------------------------------
function M.setup()
    require("dap-python").setup(get_python_path())
end

return M
