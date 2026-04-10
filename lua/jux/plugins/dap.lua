-- ----------------------------------------------------------------------------
-- DAP configuration for Neovim
-- ----------------------------------------------------------------------------
local M = {}

-- ----------------------------------------------------------------------------
-- Key mappings
-- ----------------------------------------------------------------------------
M.keys = {
    { "<F5>", function() require("dap").continue() end, desc = "continue [dap]" },
    { "<F10>", function() require("dap").step_over() end, desc = "step over [dap]" },
    { "<F11>", function() require("dap").step_into() end, desc = "step into [dap]" },
    { "<F12>", function() require("dap").step_out() end, desc = "step out [dap]" },

    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "toggle breakpoint [dap]" },
    {
        "<leader>dL",
        function()
            require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end,
        desc = "set log point [dap]",
    },

    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "toggle REPL [dap]" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "run last [dap]" },

    { "<leader>dk", function() require("dap").up() end, desc = "up [dap]" },
    { "<leader>dj", function() require("dap").down() end, desc = "down [dap]" },
}

-- ----------------------------------------------------------------------------
-- Highlight/sign definitions
-- ----------------------------------------------------------------------------
local function setup_dap_signs()
    local sign_column_hl = vim.api.nvim_get_hl(0, { name = "SignColumn", link = false })
    local sign_column_bg = sign_column_hl.bg and ("#%06x"):format(sign_column_hl.bg) or "NONE"
    local sign_column_ctermbg = sign_column_hl.ctermbg or "NONE"

    vim.api.nvim_set_hl(0, "DapBreakpoint", {
        ctermbg = sign_column_ctermbg,
        fg = "#993939",
        bg = sign_column_bg,
    })
    vim.api.nvim_set_hl(0, "DapLogPoint", {
        ctermbg = sign_column_ctermbg,
        fg = "#61afef",
        bg = sign_column_bg,
    })
    vim.api.nvim_set_hl(0, "DapStopped", {
        ctermbg = sign_column_ctermbg,
        fg = "#98c379",
        bg = sign_column_bg,
    })
    vim.api.nvim_set_hl(0, "DapCurrentLineBg", {
        ctermbg = "darkgrey",
        bg = "#2c313c",
    })

    vim.fn.sign_define("DapBreakpoint", {
        text = " ",
        texthl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapBreakpointCondition", {
        text = " ",
        texthl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapBreakpointRejected", {
        text = " ",
        texthl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapLogPoint", {
        text = " ",
        texthl = "DapLogPoint",
    })
    vim.fn.sign_define("DapStopped", {
        text = " ",
        texthl = "DapStopped",
        linehl = "DapCurrentLineBg",
    })
end

-- ----------------------------------------------------------------------------
-- Setup function
-- ----------------------------------------------------------------------------
function M.setup()
    local dap = require("dap")
    local cmp = require("cmp")

    -- ------------------------------------------------------------------------
    -- Python adapter
    -- ------------------------------------------------------------------------
    dap.adapters.python = function(cb, config)
        if config.request == "attach" then
            local port = (config.connect or config).port
            cb({
                type = "server",
                port = assert(port, "`connect.port` is required for a python `attach` configuration"),
                host = (config.connect or config).host or "127.0.0.1",
                options = {
                    source_filetype = "python",
                },
            })
        else
            cb({
                type = "executable",
                command = "python",
                args = { "-m", "debugpy.adapter" },
                options = {
                    source_filetype = "python",
                },
            })
        end
    end

    -- ------------------------------------------------------------------------
    -- Python configurations
    -- ------------------------------------------------------------------------
    dap.configurations.python = {
        {
            type = "python",
            request = "attach",
            name = "Attach (127.0.0.1:1024)",
            connect = {
                host = "127.0.0.1",
                port = 1024,
            },
            pythonPath = function()
                return "python"
            end,
            console = "integratedTerminal",
        },
        {
            type = "python",
            request = "attach",
            name = "Attach (127.0.0.1:2048)",
            connect = {
                host = "127.0.0.1",
                port = 2048,
            },
            pythonPath = function()
                return "python"
            end,
            console = "integratedTerminal",
        },
        {
            type = "python",
            request = "attach",
            name = "Attach (127.0.0.1:4096)",
            connect = {
                host = "127.0.0.1",
                port = 4096,
            },
            pythonPath = function()
                return "python"
            end,
            console = "integratedTerminal",
        },
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            pythonPath = function()
                return "python"
            end,
            console = "integratedTerminal",
        },
    }

    -- ------------------------------------------------------------------------
    -- cmp-dap integration
    -- ------------------------------------------------------------------------
    cmp.setup({
        enabled = function()
            return vim.api.nvim_get_option_value("buftype", { buf = 0 }) ~= "prompt"
                or require("cmp_dap").is_dap_buffer()
        end,
    })

    cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
            { name = "dap" },
        },
    })

    -- ------------------------------------------------------------------------
    -- Signs/highlights
    -- ------------------------------------------------------------------------
    setup_dap_signs()

    local augroup = vim.api.nvim_create_augroup("jux_dap_signs", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
        group = augroup,
        callback = setup_dap_signs,
    })
end

return M
