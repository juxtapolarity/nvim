-- check if VSCode exists
if vim.g.vscode then
    return
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "help tags" })
--vim.keymap.set('n', '<C-p>', builtin.git_files, {})
--vim.keymap.set('n', '<leader>fs', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, { desc = "in-file search" })

-- enable telescope for dap
require('telescope').setup()
require('telescope').load_extension('dap')

-- telescope for dap
vim.keymap.set('n', '<leader>d?', function()  require'telescope'.extensions.dap.commands{} end, { desc = "commands [telescope]" })
vim.keymap.set('n', '<leader>df', function()  require'telescope'.extensions.dap.frames{} end, { desc = "frames [telescope]" })
vim.keymap.set('n', '<leader>dlb', function()  require'telescope'.extensions.dap.list_breakpoints{} end, { desc = "list breakpoints [telescope]" })
vim.keymap.set('n', '<leader>dv', function()  require'telescope'.extensions.dap.variables{} end, { desc = "variables [telescope]" })

-- show keymaps
vim.keymap.set('n', '<leader>m', builtin.keymaps, { desc = "show keymaps [telescope]" })
