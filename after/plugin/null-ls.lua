-- check if VSCode exists
if vim.g.vscode then
    return
end

local null_ls = require("null-ls")

-- formatting servers
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.flake8,
    },
})

-- keymaps
vim.keymap.set('n', '<leader>F', function() require("vim.lsp.buf").format() end, { desc = "formatting [null_ls]" })
vim.keymap.set('n', '<leader>LF', function() require("null-ls").toggle("black")  format() end, { desc = "toggle formatting [null_ls]" })
vim.keymap.set('n', '<leader>LD', function() require("null-ls").toggle("flake8") end, { desc = "toggle diagnostics [null_ls]" })
