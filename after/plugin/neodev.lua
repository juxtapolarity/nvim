-- check if VSCode exists
if vim.g.vscode then
    return
end

require("neodev").setup({
    library = {
        plugins = {
            "nvim-dap-ui",
            "neotest",
        },
        types = true
    },
    ...
})

require("dapui").setup()
