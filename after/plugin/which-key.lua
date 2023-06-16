-- check if VSCode exists
if vim.g.vscode then
    return
end

local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

-- files
wk.register({
    f = {
        name = "file", -- optional group name
    },
}, {prefix = "<leader>" })

-- debug 
wk.register({
    d = {
        name = "debug", -- optional group name
    },
}, {prefix = "<leader>" })

-- harpoon
wk.register({
    h = {
        name = "harpoon", -- optional group name
    },
}, {prefix = "<leader>" })

-- trouble
wk.register({
    T = {
        name = "trouble", -- optional group name
    },
}, {prefix = "<leader>" })

