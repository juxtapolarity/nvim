-- check if VSCode exists
if vim.g.vscode then
    return
end
local _, conduct = pcall(require, 'conduct')

conduct.setup({
    cmd = {
        "ConductNewProject",
        "ConductLoadProject",
        "ConductLoadLastProject",
        "ConductLoadProjectConfig",
        "ConductReloadProjectConfig",
        "ConductDeleteProject",
        "ConductRenameProject",
        "ConductProjectNewSession",
        "ConductProjectLoadSession",
        "ConductProjectDeleteSession",
        "ConductProjectRenameSession",
    },
    hooks = {
        after_session_load = function()
            require("arrow.git").refresh_git_branch() -- Use only if separated_by_branch is true
            require("arrow.persist").load_cache_file()
        end,
    }
})
