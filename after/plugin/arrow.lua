-- check if VSCode exists
if vim.g.vscode then
    return
end
local _, arrow = pcall(require, 'arrow')

-- Define opts
local opts = {
    show_icons = true,
    leader_key = ',', -- Recommended to be a single key
    save_key = "cwd",
    buffer_leader_key = 'm', -- Per Buffer Mappings
}

-- Setup arrow
arrow.setup(opts)

