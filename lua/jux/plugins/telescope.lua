-- ----------------------------------------------------------------------------
-- Telescope configuration for Neovim
-- ----------------------------------------------------------------------------
local M = {}

-- ----------------------------------------------------------------------------
-- Helper functions
-- ----------------------------------------------------------------------------
local function search_in_buffers()
    local buffers = {}

    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(bufnr) then
            local buffer_name = vim.api.nvim_buf_get_name(bufnr)
            if buffer_name ~= "" then
                table.insert(buffers, buffer_name)
            end
        end
    end

    require("telescope.builtin").grep_string({
        search = vim.fn.input("Grep For > "),
        search_dirs = buffers,
    })
end

-- ----------------------------------------------------------------------------
-- Key mappings
-- ----------------------------------------------------------------------------
M.keys = {
    { "<leader>fbg", search_in_buffers, desc = "grep in buffers" },
    { "<leader>fbf", "<cmd>Telescope buffers<CR>", desc = "buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "help tags" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "document symbols" },

    -- Telescope DAP extension
    { "<leader>d?", "<cmd>Telescope dap commands<CR>", desc = "commands [telescope]" },
    { "<leader>df", "<cmd>Telescope dap frames<CR>", desc = "frames [telescope]" },
    { "<leader>dlb", "<cmd>Telescope dap list_breakpoints<CR>", desc = "list breakpoints [telescope]" },
    { "<leader>dv", "<cmd>Telescope dap variables<CR>", desc = "variables [telescope]" },
}

-- ----------------------------------------------------------------------------
-- Setup function
-- ----------------------------------------------------------------------------
function M.setup()
    local telescope = require("telescope")

    telescope.setup({
        defaults = {
            path_display = { "truncate" },
            layout_config = {
                horizontal = {
                    preview_width = 0.5,
                },
            },
        },
    })

    telescope.load_extension("ascii")

    local ok_dap = pcall(require, "dap")
    if ok_dap then
        telescope.load_extension("dap")
    end
end

return M
