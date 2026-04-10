local M = {}

function M.setup()
    require("arrow").setup({
        show_icons = true,
        leader_key = ",",
        save_key = "cwd",
        buffer_leader_key = "m",
    })
end

return M
-- local M = {}
--
-- local function refresh_lualine()
--     local ok, lualine = pcall(require, "lualine")
--     if ok then
--         vim.schedule(function()
--             lualine.refresh({
--                 place = { "statusline" },
--             })
--         end)
--     end
-- end
--
-- function M.setup()
--     require("arrow").setup({
--         show_icons = true,
--         leader_key = ",",
--         save_key = "cwd",
--         buffer_leader_key = "m",
--     })
--
--     local group = vim.api.nvim_create_augroup("jux_arrow_lualine_refresh", { clear = true })
--
--     vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
--         group = group,
--         callback = function()
--             refresh_lualine()
--         end,
--     })
-- end
--
-- return M
