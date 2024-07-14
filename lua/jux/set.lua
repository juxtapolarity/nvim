-- leader key
vim.g.mapleader = " "

if vim.g.vscode then
else
-- line numbers
vim.opt.number = true -- show absolute line numbers
vim.opt.relativenumber = true -- show relative line numbers

-- indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- fast update time
vim.opt.updatetime = 50

-- conceal level
vim.opt.conceallevel = 2

-- color column (the vertical line)
vim.opt.colorcolumn = "80"
end
