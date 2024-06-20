-- check if VSCode exists
if vim.g.vscode then
    return
end

local mason = require("mason")
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "pyright" }
})

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({})
  end,
})
