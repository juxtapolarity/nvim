local M = {}

function M.setup()
    local mc = require("multicursor-nvim")

    mc.setup()

    -- Add cursors above/below the main cursor.
    vim.keymap.set({ "n", "v" }, "<Up>", function()
        mc.addCursor("k")
    end)

    vim.keymap.set({ "n", "v" }, "<Down>", function()
        mc.addCursor("j")
    end)

    -- Add a cursor and jump to the next word under cursor.
    vim.keymap.set({ "n", "v" }, "<C-n>", function()
        mc.addCursor("*")
    end)

    -- Jump to the next word under cursor but do not add a cursor.
    vim.keymap.set({ "n", "v" }, "<C-s>", function()
        mc.skipCursor("*")
    end)

    -- Rotate the main cursor.
    vim.keymap.set({ "n", "v" }, "<Left>", mc.nextCursor)
    vim.keymap.set({ "n", "v" }, "<Right>", mc.prevCursor)

    -- Delete the main cursor.
    vim.keymap.set({ "n", "v" }, "<leader>x", mc.deleteCursor)

    -- Add and remove cursors with control + left click.
    vim.keymap.set("n", "<C-LeftMouse>", mc.handleMouse)

    vim.keymap.set({ "n", "v" }, "<C-q>", function()
        if mc.cursorsEnabled() then
            mc.disableCursors()
        else
            mc.addCursor()
        end
    end)

    vim.keymap.set("n", "<Esc>", function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        elseif mc.hasCursors() then
            mc.clearCursors()
        else
            -- keep default escape behavior
            vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
                "n",
                false
            )
        end
    end)

    -- Align cursor columns.
    vim.keymap.set("n", "<leader>a", mc.alignCursors)

    -- Split visual selections by regex.
    vim.keymap.set("v", "S", mc.splitCursors)

    -- Append/insert for each line of visual selections.
    vim.keymap.set("v", "I", mc.insertVisual)
    vim.keymap.set("v", "A", mc.appendVisual)

    -- Match new cursors within visual selections by regex.
    vim.keymap.set("v", "M", mc.matchCursors)

    -- Rotate visual selection contents.
    vim.keymap.set("v", "<leader>t", function()
        mc.transposeCursors(1)
    end)

    vim.keymap.set("v", "<leader>T", function()
        mc.transposeCursors(-1)
    end)

    -- Customize how cursors look.
    vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
    vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
end

return M
