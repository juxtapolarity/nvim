-- check if VSCode exists
if vim.g.vscode then
    return
end

require('gitsigns').setup()
