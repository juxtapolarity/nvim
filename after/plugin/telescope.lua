-- check if VSCode exists
if vim.g.vscode then
    return
end
local _, telescope = pcall(require, 'telescope')
local ok_dap, dap = pcall(require, 'dap')
telescope.load_extension("ascii")
telescope.load_extension("undo")

local opts = {
  extensions = {
    undo = {
      side_by_side = true,
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.8,
      },
    },
  },
}
telescope.setup(opts)
if ok_dap then
  telescope.load_extension("dap")
end

vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", { desc = "find files" })
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", { desc = "live grep" })
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>", { desc = "buffers" })
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>", { desc = "help tags" })
vim.keymap.set('n', '<leader>fs', ":Telescope lsp_document_symbols<CR>", { desc = "document symbols" })

-- telescope for dap
vim.keymap.set('n', '<leader>d?', ":Telescope dap commands<CR>", { desc = "commands [telescope]" })
vim.keymap.set('n', '<leader>df', ":Telescope dap frames<CR>", { desc = "frames [telescope]" })
vim.keymap.set('n', '<leader>dlb', ":Telescope dap list_breakpoints<CR>", { desc = "list breakpoints [telescope]" })
vim.keymap.set('n', '<leader>dv', ":Telescope dap variables<CR>", { desc = "variables [telescope]" })

-- show keymaps
vim.keymap.set('n', '<leader>m', ":Telescope keymaps<CR>", { desc = "show keymaps [telescope]" })

-- telescope undo
vim.keymap.set('n', '<leader>u', ":Telescope undo<CR>", { desc = "telescope undo" })
