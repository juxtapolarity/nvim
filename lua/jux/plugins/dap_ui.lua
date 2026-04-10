-- ----------------------------------------------------------------------------
-- DAP UI configuration for Neovim
-- ----------------------------------------------------------------------------
local M = {}

-- ----------------------------------------------------------------------------
-- Helper functions
-- ----------------------------------------------------------------------------
local function get_visual_selection()
    local mode = vim.fn.mode()
    if mode ~= "v" and mode ~= "V" and mode ~= "\22" then
        return nil
    end

    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local start_line = start_pos[2] - 1
    local start_col = start_pos[3] - 1
    local end_line = end_pos[2] - 1
    local end_col = end_pos[3]

    local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line + 1, false)
    if #lines == 0 then
        return nil
    end

    lines[1] = string.sub(lines[1], start_col + 1)
    lines[#lines] = string.sub(lines[#lines], 1, end_col)

    return table.concat(lines, "\n")
end

-- ----------------------------------------------------------------------------
-- Key mappings
-- ----------------------------------------------------------------------------
M.keys = {
    {
        "<leader>dt",
        function()
            require("dapui").toggle()
        end,
        desc = "toggle [dapui]",
    },
    {
        "<leader>de",
        function()
            local dap = require("dap")
            local expression = vim.fn.expand("<cword>")
            dap.repl.append(expression)
        end,
        desc = "send expression to REPL",
        mode = "n",
    },
    {
        "<leader>de",
        function()
            local dap = require("dap")
            local expression = get_visual_selection()
            if expression then
                dap.repl.append(expression)
            end
        end,
        desc = "send highlighted text to REPL",
        mode = "v",
    },
    {
        "<leader>dh",
        function()
            require("dap.ui.widgets").hover()
        end,
        desc = "hover [dap]",
        mode = { "n", "v" },
    },
    {
        "<leader>dp",
        function()
            require("dap.ui.widgets").preview()
        end,
        desc = "preview [dap]",
        mode = { "n", "v" },
    },
    {
        "<leader>ds",
        function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scopes)
        end,
        desc = "scopes [dap]",
    },
}

-- ----------------------------------------------------------------------------
-- Setup function
-- ----------------------------------------------------------------------------
function M.setup()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({})

    dap.listeners.before.attach["jux_dapui"] = function()
        dapui.open()
    end

    dap.listeners.before.launch["jux_dapui"] = function()
        dapui.open()
    end

    dap.listeners.before.event_terminated["jux_dapui"] = function()
        dapui.close()
    end

    dap.listeners.before.event_exited["jux_dapui"] = function()
        dapui.close()
    end
end

return M
