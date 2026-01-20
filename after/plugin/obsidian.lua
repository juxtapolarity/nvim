-- after/plugin/obsidian.lua
if vim.g.vscode then return end

local ok, obsidian = pcall(require, "obsidian")
if not ok then
  vim.notify("Failed to load obsidian.nvim (require('obsidian') failed)", vim.log.levels.ERROR)
  return
end

local vault_path = vim.fn.expand("~/obsidian/juxnotes")

obsidian.setup({
  workspaces = {
    { name = "juxnotes", path = vault_path },
  },

  notes = { folder = "Notes" },

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

  follow_url_func = function(url)
    if vim.fn.has("win32") == 1 then
      vim.fn.jobstart({ "cmd.exe", "/c", "start", "", url }, { detach = true })
    else
      vim.fn.jobstart({ "xdg-open", url }, { detach = true })
    end
  end,

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

  templates = { folder = "Templates" },
})

-- Keymaps (define once)
if not vim.g.__jux_obsidian_keymaps then
  vim.g.__jux_obsidian_keymaps = true
  vim.keymap.set("n", "<leader>oa", ":ObsidianOpen<CR>", { desc = "Open in app" })
  vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "Create note" })
  vim.keymap.set("n", "<leader>oc", ":ObsidianToggleCheckbox<CR>", { desc = "Toggle checkbox" })
  vim.keymap.set("n", "<leader>of", ":ObsidianQuickSwitch<CR>", { desc = "Find files" })
  vim.keymap.set("n", "<leader>og", ":ObsidianSearch<CR>", { desc = "Find grep" })
  vim.keymap.set("n", "<leader>ol", ":ObsidianLink<CR>", { desc = "Create link" })
  vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Backlinks" })
  vim.keymap.set("n", "<leader>oo", ":ObsidianFollowLink<CR>", { desc = "Follow link" })
  vim.keymap.set("n", "<leader>ox", ":ObsidianTags<CR>", { desc = "Tags" })
  vim.keymap.set("n", "<leader>oy", ":ObsidianYesterday<CR>", { desc = "Yesterday" })
  vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "Today" })
  vim.keymap.set("n", "<leader>oz", ":ObsidianTomorrow<CR>", { desc = "Tomorrow" })
  vim.keymap.set("n", "<leader>oi", ":ObsidianPasteImg<CR>", { desc = "Paste image" })
  vim.keymap.set("n", "<leader>oT", ":ObsidianTemplate<CR>", { desc = "Template" })
end

vim.notify("obsidian setup complete", vim.log.levels.INFO)

