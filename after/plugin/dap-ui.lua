-- check if VSCode exists
if vim.g.vscode then
    return
end

local dapui_ok, dapui = pcall(require, 'dapui')
if dapui_ok then
    dapui.setup()
    -- vim.keymap.set('n', '<leader>do', function() require("dapui").open() end, { desc = "open [dapui]" })
    -- vim.keymap.set('n', '<leader>dc', function() require("dapui").close() end, { desc = "close [dapui]" })
    vim.keymap.set('n', '<leader>dt', function() require("dapui").toggle() end, { desc = "toggle [dapui]" })

    -- Function to send expression to the REPL
    local function eval_in_repl()
        local dap = require("dap")
        local expression = vim.fn.expand("<cword>") -- Get the word under the cursor in normal mode
        dap.repl.append(expression)
    end

    -- Mapping for normal mode to evaluate the word under the cursor
    vim.keymap.set('n', '<leader>de', eval_in_repl, { desc = "send expression to REPL" })

    -- Mapping for visual mode to evaluate highlighted text
    vim.keymap.set('v', '<leader>de', function()
        local dap = require("dap")
        local expression = vim.fn.getreg("v") -- Get the visual selection
        dap.repl.append(expression)
    end, { desc = "send highlighted text to REPL" })
end
