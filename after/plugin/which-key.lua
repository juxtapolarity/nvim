if vim.g.vscode then
    return
end

local ok, wk = pcall(require, "which-key")
if ok then
    -- wk.setup({})
    --
    -- -- Minimal configuration to isolate the issue
    -- wk.register({
    --     d = { name = "debug" },
    --     f = { name = "file" },
    --     G = { name = "git" },
    --     h = { name = "harpoon" },
    --     o = { name = "obsidian" },
    --     T = { name = "trouble" },
    -- }, { prefix = "<leader>" })
    wk.add({
      { "<leader>d", group = "debug" }, -- group
      { "<leader>f", group = "file" }, -- group
      { "<leader>G", group = "git" }, -- group
      { "<leader>h", group = "harpoon" }, -- group
      { "<leader>o", group = "obsidian" }, -- group
      { "<leader>T", group = "trouble" }, -- group
    })
else
    vim.notify('Failed to load which-key', vim.log.levels.ERROR)
end
