local M = {}

M.keys = {
    { "<leader>d?", "<cmd>Telescope dap commands<CR>", desc = "commands [telescope]" },
    { "<leader>df", "<cmd>Telescope dap frames<CR>", desc = "frames [telescope]" },
    { "<leader>dlb", "<cmd>Telescope dap list_breakpoints<CR>", desc = "list breakpoints [telescope]" },
    { "<leader>dv", "<cmd>Telescope dap variables<CR>", desc = "variables [telescope]" },
}

function M.setup()
    require("telescope").load_extension("dap")
end

return M
