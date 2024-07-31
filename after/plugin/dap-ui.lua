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
end
