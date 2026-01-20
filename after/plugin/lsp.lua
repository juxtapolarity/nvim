-- quit early inside VSCode
if vim.g.vscode then return end

-- --- capabilities (cmp) ---
local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()
if has_cmp then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- --- on_attach keymaps (buffer-local) ---
local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
  end
  map("n", "gD", vim.lsp.buf.declaration)
  map("n", "gd", vim.lsp.buf.definition)
  map("n", "K",  vim.lsp.buf.hover)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "<leader>k", vim.lsp.buf.signature_help)
  map("n", "<space>D", vim.lsp.buf.type_definition)
  map("n", "<space>rn", vim.lsp.buf.rename)
  map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action)
  map("n", "gr", vim.lsp.buf.references)
  map("n", "<space>f", function() vim.lsp.buf.format({ async = true }) end)
end

-- --- mason + lspconfig wiring ---
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "lua_ls" }, -- add more
  automatic_installation = true,
})

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers({
  -- default handler
  function(server)
    lspconfig[server].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,

  -- lua: tweak diagnostics/workspace
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })
  end,
})

-- --- matlab_ls (guard per-OS/path so it doesn't break Linux) ---
local is_windows = package.config:sub(1,1) == "\\"
if is_windows then
  lspconfig.matlab_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "matlab-language-server", "--stdio" },
    filetypes = { "matlab" },
    settings = {
      matlab = {
        matlabExecutablePath = "C:\\Program Files\\MATLAB\\R2022a\\bin\\matlab",
      },
    },
  })
end

-- --- global diagnostics you already use ---
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

