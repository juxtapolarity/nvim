local M = {}

M.keys = {
    { "<leader>aa", function() require("opencode").ask("@this: ", { submit = true }) end, mode = { "n", "x" }, desc = "ask" },
    { "<leader>as", function() require("opencode").select() end,                           mode = { "n", "x" }, desc = "select action" },
    { "<leader>at", function() require("opencode").toggle() end,                           mode = { "n", "t" }, desc = "toggle" },
    { "<leader>ao", function() return require("opencode").operator("@this ") end,          mode = { "n", "x" }, expr = true, desc = "operator (range/selection)" },
    { "<leader>al", function() return require("opencode").operator("@this ") .. "_" end,   mode = "n",          expr = true, desc = "operator (line)" },
    { "<leader>au", function() require("opencode").command("session.half.page.up") end,    mode = "n",          desc = "scroll up" },
    { "<leader>ad", function() require("opencode").command("session.half.page.down") end,  mode = "n",          desc = "scroll down" },
}

function M.setup()
    ---@type opencode.Opts
    vim.g.opencode_opts = {}

    vim.o.autoread = true
end

return M
