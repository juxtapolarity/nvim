if vim.g.vscode then
    return
end

-- vim.defer_fn(function()
--     local dap_virtual_text_ok, dap_virtual_text = pcall(require, 'nvim-dap-virtual-text')
--     if dap_virtual_text_ok then
--         dap_virtual_text.setup()
--     else
--         vim.notify('Failed to load nvim-dap-virtual-text', vim.log.levels.ERROR)
--     end
-- end, 0)
--
