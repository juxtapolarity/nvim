-- check if VSCode exists
if vim.g.vscode then
    return
end

local ok, obsidian = pcall(require, 'obsidian')
if ok then
    obsidian.setup({
        workspaces = {
          {
            name = "juxnotes",
            path = "/mnt/c/Users/juls/obsidian/juxnotes",
            -- path = "~/obsidian/juxnotes",
          },
        },

        -- New note default folder
        notes = {
            folder = "Notes",
        },

       -- Optional, configure additional syntax highlighting / extmarks.
       -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
       ui = {
           enable = true,    -- set to false to disable all additional syntax features
           update_debounce = 200,    -- update delay after a text change (in milliseconds)
           max_file_length = 5000,    -- disable UI features for files with more than this many lines
           -- Define how various check-boxes are displayed
           checkboxes = {
               -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
               [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
               ["x"] = { char = "", hl_group = "ObsidianDone" },
               [">"] = { char = "", hl_group = "ObsidianRightArrow" },
               ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
               ["!"] = { char = "", hl_group = "ObsidianImportant" },
               -- Replace the above with this if you don't have a patched font:
               -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
               -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

               -- You can also add more custom ones...
           },
           -- Use bullet marks for non-checkbox lists.
           bullets = { char = "•", hl_group = "ObsidianBullet" },
           external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
           -- Replace the above with this if you don't have a patched font:
           -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
           reference_text = { hl_group = "ObsidianRefText" },
           highlight_text = { hl_group = "ObsidianHighlightText" },
           tags = { hl_group = "ObsidianTag" },
           block_ids = { hl_group = "ObsidianBlockID" },
           hl_groups = {
               -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
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
            -- Optional, if you keep daily notes in a separate directory.
            folder = "Dailies",
            -- folder = "notes/dailies",
            -- Optional, default tags to add to each new daily note created.
            default_tags = { "daily-notes" },
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = "Templates/daily.md",
        },



        -- Optional, customize how note IDs are generated given an optional title.
        ---@param title string|?
        ---@return string
        note_id_func = function(title)
          -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
          -- In this case a note with the title 'My new note' will be given an ID that looks
          -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
          local suffix = ""
          if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
          else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end
          return tostring(os.time()) .. "-" .. suffix
        end,

        -- Optional, customize how note file names are generated given the ID, target directory, and title.
        ---@param spec { id: string, dir: obsidian.Path, title: string|? }
        ---@return string|obsidian.Path The full path to the new note.
        note_path_func = function(spec)
          -- This is equivalent to the default behavior.
          local path = spec.dir / "Notes" / tostring(spec.id)
          return path:with_suffix(".md")
        end,

        -- Optional, for templates (see below).
        templates = {
          folder = "Templates",
        },

        })

    -- Add your custom key mappings for Obsidian plugin
    vim.keymap.set('n', '<leader>oa', ":ObsidianOpen<CR>", { desc = "Open in app" })
    vim.keymap.set('n', '<leader>on', ":ObsidianNew<CR>", { desc = "Create note" })
    vim.keymap.set('n', '<leader>oc', ":ObsidianToggleCheckbox<CR>", { desc = "Toggle checkbox" })
    vim.keymap.set('n', '<leader>of', ":ObsidianQuickSwitch<CR>", { desc = "Find files"})
    vim.keymap.set('n', '<leader>og', ":ObsidianSearch<CR>", { desc = "Find grep" })
    vim.keymap.set('n', '<leader>ol', ":ObsidianLink<CR>", { desc = "Create link" })
    vim.keymap.set('n', '<leader>ob', ":ObsidianBacklinks<CR>", { desc = "Backlinks" })
    vim.keymap.set('n', '<leader>oo', ":ObsidianFollowLink<CR>", { desc = "Onwards to link" })
    vim.keymap.set('n', '<leader>ox', ":ObsidianTag<CR>", { desc = "Tags" })
    vim.keymap.set('n', '<leader>oy', ":ObsidianYesterday<CR>", { desc = "Open yesterday's note" })
    vim.keymap.set('n', '<leader>ot', ":ObsidianToday<CR>", { desc = "Open today's note" })
    vim.keymap.set('n', '<leader>oz', ":ObsidianTomorrow<CR>", { desc = "Open tomorrow's note" })
    vim.keymap.set('n', '<leader>oi', ":ObsidianPasteImg<CR>", { desc = "Paste image" })

    vim.notify('obsidian setup complete', vim.log.levels.INFO)
else
    vim.notify('Failed to load obsidian', vim.log.levels.ERROR)
end
