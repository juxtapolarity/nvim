-- check if VSCode exists
if vim.g.vscode then
    return
end

vim.keymap.set('n', '<leader>dn', function() require("neotest").run.run() end, { desc = "run nearest [neotest]" })
vim.keymap.set('n', '<leader>dd', function() require("neotest").run.run({strategy = "dap"}) end, { desc = "debug nearest test [neotest]" })
vim.keymap.set('n', '<leader>dN', function() require("neotest").run.stop() end, { desc = "stop nearest test [neotest]" })
vim.keymap.set('n', '<leader>da', function() require("neotest").run.attach() end, { desc = "attach to nearest test [neotest]" })
vim.keymap.set('n', '<leader>d!', function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "run current file [neotest]" })
vim.keymap.set('n', '<leader>dS', function() require('neotest').summary.toggle() end, { desc = "test summary"})

-- set up pytest as the test runner
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})
