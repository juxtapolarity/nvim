-- check if VSCode exists
if vim.g.vscode then
  return
end

-- 1) mason (you already had this)
require("mason").setup()

-- 2) cmp capabilities (so LSP completion works)
local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()
if has_cmp then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- 3) helper to define + enable a server (new 0.11 API)
local function setup(server, opts)
  opts = vim.tbl_deep_extend("force", {
    capabilities = capabilities,
  }, opts or {})

  -- define config
  vim.lsp.config(server, opts)
end

-- 4) define your servers
setup("pyright", {
  -- extra pyright settings go here if you want
})

setup("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false },
    },
  },
})

-- you had this in the old file
setup("matlab_ls", {
  cmd = { "matlab-language-server", "--stdio" },
  filetypes = { "matlab" },
  settings = {
    matlab = {
      matlabExecutablePath = "C:\\Program Files\\MATLAB\\R2022a\\bin\\matlab",
    },
  },
})

-- 5) actually enable them
vim.lsp.enable({ "pyright", "lua_ls", "matlab_ls" })

-- 6) your LspAttach keymaps (kept, just moved down)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- 7) global diagnostics (you already had these)
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

