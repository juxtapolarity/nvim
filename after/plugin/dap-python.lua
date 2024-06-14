if vim.g.vscode then
    return
end

vim.defer_fn(function()
    -- debugging keymaps
    vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "continue [dap]" })
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "step over [dap]" })
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "step into [dap]" })
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "step out [dapui]" })
    vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { desc = "toggle breakpoint [dap]" })
    vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end, { desc = "set breakpoint [dap]" })
    vim.keymap.set('n', '<Leader>dlp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "repl [dap]" })
    vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "run last [dap]" })
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end, { desc = "hover [dap]" })
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end, { desc = "preview [dap]" })
    vim.keymap.set('n', '<Leader>df', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<Leader>ds', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
    end)

    vim.keymap.set('n', '<Leader>dk', function() require('dap').up() end, { desc = "up [dap]" })
    vim.keymap.set('n', '<Leader>dj', function() require('dap').down() end, { desc = "down [dap]" })

    -- start dap-python
    local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
    require('dap-python').setup(mason_path .. "packages/debugpy/venv/Scripts/python")
end, 0)

