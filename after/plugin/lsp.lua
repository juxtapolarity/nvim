-- quit early inside VSCode
if vim.g.vscode then return end

-- --- capabilities (cmp) ---
local capabilities = vim.lsp.protocol.make_client_capabilities()
do
  local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
  if ok then
    capabilities = cmp_lsp.default_capabilities(capabilities)
  end
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

-- --- global diagnostics you already use ---
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- --- mason ---
do
  local ok, mason = pcall(require, "mason")
  if ok then
    mason.setup()
  end
end

-- Servers you care about
local servers = {
  pyright = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
}

-- Windows-only matlab language server
local is_windows = package.config:sub(1,1) == "\\"
if is_windows then
  servers.matlab_ls = {
    cmd = { "matlab-language-server", "--stdio" },
    filetypes = { "matlab" },
    settings = {
      matlab = {
        matlabExecutablePath = "C:\\Program Files\\MATLAB\\R2022a\\bin\\matlab",
      },
    },
  }
end

-- --- Embedded LSP config (Neovim 0.11+/0.12+) with fallback ---
if type(vim.lsp.config) == "function" and type(vim.lsp.enable) == "function" then
  -- New embedded style
  for name, cfg in pairs(servers) do
    cfg.capabilities = capabilities
    cfg.on_attach = on_attach

    vim.lsp.config(name, cfg)
    vim.lsp.enable(name)
  end
else
  -- Fallback for older builds (or if embedded API changes)
  local ok, lspconfig = pcall(require, "lspconfig")
  if ok then
    for name, cfg in pairs(servers) do
      cfg.capabilities = capabilities
      cfg.on_attach = on_attach
      lspconfig[name].setup(cfg)
    end
  end
end

