-- ----------------------------------------------------------------------------
-- LSP configuration for Neovim
-- ----------------------------------------------------------------------------
local M = {}

-- ----------------------------------------------------------------------------
-- Setup function
-- ----------------------------------------------------------------------------
function M.setup()
    -- ------------------------------------------------------------------------
    -- Capabilities (cmp)
    -- ------------------------------------------------------------------------
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if ok_cmp then
        capabilities = cmp_lsp.default_capabilities(capabilities)
    end

    -- ------------------------------------------------------------------------
    -- on_attach keymaps (buffer-local)
    -- ------------------------------------------------------------------------
    local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = bufnr,
                silent = true,
                desc = desc,
            })
        end

        map("n", "gD", vim.lsp.buf.declaration, "LSP declaration")
        map("n", "gd", vim.lsp.buf.definition, "LSP definition")
        map("n", "K", vim.lsp.buf.hover, "LSP hover")
        map("n", "gi", vim.lsp.buf.implementation, "LSP implementation")
        map("n", "<leader>k", vim.lsp.buf.signature_help, "LSP signature help")
        map("n", "<leader>D", vim.lsp.buf.type_definition, "LSP type definition")
        map("n", "<leader>rn", vim.lsp.buf.rename, "LSP rename")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP code action")
        map("n", "gr", vim.lsp.buf.references, "LSP references")
        map("n", "<leader>cF", function()
            vim.lsp.buf.format({ async = true })
        end, "LSP format")
    end

    -- ------------------------------------------------------------------------
    -- Global diagnostics
    -- ------------------------------------------------------------------------
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostic float" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

    -- ------------------------------------------------------------------------
    -- Mason
    -- ------------------------------------------------------------------------
    local ok_mason, mason = pcall(require, "mason")
    if ok_mason then
        mason.setup()
    end

    -- ------------------------------------------------------------------------
    -- Server definitions
    -- ------------------------------------------------------------------------
    local servers = {
        pyright = {
            settings = {
                pyright = {
                    disableOrganizeImports = true,
                },
            },
        },

        ruff = {},
        -- ruff = {
        --     init_options = {
        --         settings = {
        --             -- Ruff server settings go here if needed
        --         },
        --     },
        -- },

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

    local is_windows = package.config:sub(1, 1) == "\\"
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

    -- ------------------------------------------------------------------------
    -- Neovim 0.11+ core LSP
    -- ------------------------------------------------------------------------
    for name, cfg in pairs(servers) do
        cfg.capabilities = capabilities
        cfg.on_attach = on_attach

        vim.lsp.config(name, cfg)
        vim.lsp.enable(name)
    end

    -- ------------------------------------------------------------------------
    -- LspAttach
    -- ------------------------------------------------------------------------
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("jux_disable_ruff_hover", { clear = true }),
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and client.name == "ruff" then
                client.server_capabilities.hoverProvider = false
            end
        end,
    })
end

return M
