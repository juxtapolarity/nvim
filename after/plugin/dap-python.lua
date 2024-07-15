-- after/plugin/nvim-dap-python.lua
if vim.g.vscode then
    return
end

-- debugging keymaps
local dap_ok, dap = pcall(require, 'dap')
if dap_ok then
    vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = "continue [dap]" })
    vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = "step over [dap]" })
    vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = "step into [dap]" })
    vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = "step out [dap]" })
    vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end, { desc = "toggle breakpoint [dap]" })
    -- vim.keymap.set('n', '<Leader>dB', function() dap.set_breakpoint() end, { desc = "set breakpoint [dap]" })
    vim.keymap.set('n', '<Leader>dlp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end, { desc = "repl [dap]" })
    vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end, { desc = "run last [dap]" })
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

    vim.keymap.set('n', '<Leader>dk', function() dap.up() end, { desc = "up [dap]" })
    vim.keymap.set('n', '<Leader>dj', function() dap.down() end, { desc = "down [dap]" })

    -- Function to update dap-python configuration
    local function update_dap_python()
        local swenv = require('swenv')
        local current_venv_path = swenv.get_current_venv_path()
        if current_venv_path then
            require('dap-python').setup(current_venv_path .. '/bin/python')
        else
            vim.notify('No virtual environment selected or found!', vim.log.levels.WARN)
        end
    end

    -- -- Initial setup of dap-python
    -- update_dap_python()
    --
    -- -- Update dap-python whenever the environment changes
    -- local swenv = require('swenv')
    -- swenv.setup({
    --     post_set_venv = function()
    --         update_dap_python()
    --     end,
    -- })
    --
end
