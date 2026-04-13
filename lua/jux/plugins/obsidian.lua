-- ----------------------------------------------------------------------------
-- Obsidian configuration for Neovim
-- ----------------------------------------------------------------------------
local M = {}

local uv = vim.uv or vim.loop
local is_windows = vim.fn.has("win32") == 1
local vault_path = vim.fs.normalize(vim.fn.expand("~/obsidian/juxnotes"))

-- ----------------------------------------------------------------------------
-- Helper functions
-- ----------------------------------------------------------------------------
local function path_exists(path)
    return uv.fs_stat(path) ~= nil
end

local function obsidian_app_exists()
    if is_windows then
        if vim.fn.executable("Obsidian") == 1 or vim.fn.executable("Obsidian.exe") == 1 then
            return true
        end

        vim.fn.system({ "reg", "query", [[HKCR\obsidian]] })
        return vim.v.shell_error == 0
    end

    if vim.fn.executable("obsidian") == 1 then
        return true
    end

    if vim.fn.executable("xdg-mime") == 1 then
        local handler = vim.fn.system({ "xdg-mime", "query", "default", "x-scheme-handler/obsidian" })
        if vim.v.shell_error == 0 and handler and handler:gsub("%s+", "") ~= "" then
            return true
        end
    end

    return false
end

function M.is_available()
    return path_exists(vault_path) and obsidian_app_exists()
end

-- ----------------------------------------------------------------------------
-- Key mappings
-- ----------------------------------------------------------------------------
M.keys = {
    { "<leader>oa", "<cmd>Obsidian open<CR>", desc = "Open in app" },
    { "<leader>on", "<cmd>Obsidian new<CR>", desc = "Create note" },
    { "<leader>oc", "<cmd>Obsidian toggle_checkbox<CR>", desc = "Toggle checkbox" },
    { "<leader>of", "<cmd>Obsidian quick_switch<CR>", desc = "Find files" },
    { "<leader>og", "<cmd>Obsidian search<CR>", desc = "Find grep" },
    { "<leader>ol", "<cmd>Obsidian link<CR>", mode = "v", desc = "Create link" },
    { "<leader>ob", "<cmd>Obsidian backlinks<CR>", desc = "Backlinks" },
    { "<leader>oo", "<cmd>Obsidian follow_link<CR>", desc = "Follow link" },
    { "<leader>ox", "<cmd>Obsidian tags<CR>", desc = "Tags" },
    { "<leader>oy", "<cmd>Obsidian yesterday<CR>", desc = "Yesterday" },
    { "<leader>ot", "<cmd>Obsidian today<CR>", desc = "Today" },
    { "<leader>oz", "<cmd>Obsidian tomorrow<CR>", desc = "Tomorrow" },
    { "<leader>oi", "<cmd>Obsidian paste_img<CR>", desc = "Paste image" },
    { "<leader>oT", "<cmd>Obsidian template<CR>", desc = "Template" },
}

-- ----------------------------------------------------------------------------
-- Setup function
-- ----------------------------------------------------------------------------
function M.setup()
    require("obsidian").setup({
        legacy_commands = false,

        workspaces = {
            { name = "juxnotes", path = vault_path },
        },

        notes_subdir = "Notes",

        picker = {
            name = "telescope.nvim",
        },

        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },

        statusline = {
            enabled = false,
        },

        footer = {
            enabled = false,
            separator = false,
        },

        ui = {
            enable = true,
            update_debounce = 200,
            max_file_length = 5000,
            checkboxes = {
                [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                ["x"] = { char = "", hl_group = "ObsidianDone" },
                [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                ["!"] = { char = "", hl_group = "ObsidianImportant" },
            },
            bullets = { char = "•", hl_group = "ObsidianBullet" },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            reference_text = { hl_group = "ObsidianRefText" },
            highlight_text = { hl_group = "ObsidianHighlightText" },
            tags = { hl_group = "ObsidianTag" },
            block_ids = { hl_group = "ObsidianBlockID" },
            hl_groups = {
                ObsidianTodo = { bold = true, fg = "#f78c6c" },
                ObsidianDone = { bold = true, fg = "#89ddff" },
                ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                ObsidianTilde = { bold = true, fg = "#ff5370" },
                ObsidianImportant = { bold = true, fg = "#d73128" },
                ObsidianBullet = { bold = true, fg = "#89ddff" },
                ObsidianRefText = { underline = true, fg = "#c792ea" },
                ObsidianExtLinkIcon = { fg = "#c792ea" },
                ObsidianTag = { italic = true, fg = "#89ddff" },
                ObsidianBlockID = { italic = true, fg = "#89ddff" },
                ObsidianHighlightText = { bg = "#75662e" },
            },
        },

        daily_notes = {
            folder = "Dailies",
            default_tags = { "daily-notes" },
            template = "daily.md",
        },

        templates = {
            folder = "Templates",
        },

        note_id_func = function(title)
            local suffix = ""
            if title ~= nil then
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.time()) .. "-" .. suffix
        end,

        note_path_func = function(spec)
            local path = spec.dir / "Notes" / tostring(spec.id)
            return path:with_suffix(".md")
        end,
    })
end

return M
