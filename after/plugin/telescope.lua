-- check if VSCode exists
if vim.g.vscode then
    return
end
local _, telescope = pcall(require, 'telescope')
local ok_dap, dap = pcall(require, 'dap')
telescope.load_extension("ascii")
telescope.load_extension("undo")
telescope.load_extension("projects")

local opts = {
    defaults = {
        path_display = { "truncate" },  -- Truncate the left part of long paths
        layout_config = {
            horizontal = {
                preview_width = 0.5, -- adjust to fit more filename text if necessary
            },
        },
    },
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

-- Define the search_in_buffers function globally
_G.search_in_buffers = function()
  -- Collect the contents of all open buffers
  local buffers = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) then
      local buffer_name = vim.api.nvim_buf_get_name(bufnr)
      if buffer_name ~= "" then
        table.insert(buffers, buffer_name)
      end
    end
  end

  -- Use vimgrep to search through these buffers
  require('telescope.builtin').grep_string({
    search = vim.fn.input("Grep For > "),
    search_dirs = buffers,
  })
end

-- Create a keymap for this function
vim.keymap.set('n', '<leader>fbg', "<cmd>lua search_in_buffers()<CR>", { desc = "grep in buffers" })

vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", { desc = "find files" })
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", { desc = "live grep" })
vim.keymap.set('n', '<leader>fbf', ":Telescope buffers<CR>", { desc = "buffers" })
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>", { desc = "help tags" })
vim.keymap.set('n', '<leader>fs', ":Telescope lsp_document_symbols<CR>", { desc = "document symbols" })
vim.keymap.set('n', '<leader>cp', ":Telescope conduct projects<CR>", { desc = "projects" })
vim.keymap.set('n', '<leader>cs', ":Telescope conduct sessions<CR>", { desc = "sessions" })

-- telescope for dap
vim.keymap.set('n', '<leader>d?', ":Telescope dap commands<CR>", { desc = "commands [telescope]" })
vim.keymap.set('n', '<leader>df', ":Telescope dap frames<CR>", { desc = "frames [telescope]" })
vim.keymap.set('n', '<leader>dlb', ":Telescope dap list_breakpoints<CR>", { desc = "list breakpoints [telescope]" })
vim.keymap.set('n', '<leader>dv', ":Telescope dap variables<CR>", { desc = "variables [telescope]" })

-- ui widgets for dap
vim.keymap.set('n', '<leader>di', function() require"dap.ui.widgets".hover() end, { desc = "hover [dap]" })
vim.keymap.set('n', '<leader>dd', function()
    local widgets = require "dap.ui.widgets";
    widgets.centered_float(widgets.scopes)
end, { desc = "scopes [dap]" })

-- show keymaps
-- vim.keymap.set('n', '<leader>m', ":Telescope keymaps<CR>", { desc = "show keymaps [telescope]" })

-- telescope undo
vim.keymap.set('n', '<leader>u', ":Telescope undo<CR>", { desc = "telescope undo" })

