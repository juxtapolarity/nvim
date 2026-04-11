-- ----------------------------------------------------------------------------
-- Function to apply custom highlights
-- ----------------------------------------------------------------------------
local function apply_highlights()

    -- ------------------------------------------------------------------------
    -- General custom highlights
    -- ------------------------------------------------------------------------

    -- General highlight overrides for syntax groups
    vim.api.nvim_set_hl(0, "Function", { fg = "#ad60f4" })
    vim.api.nvim_set_hl(0, "Type", { fg = "#ad60f4" })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#444B6A" })
    vim.api.nvim_set_hl(0, "String", { fg = "#ad8ee6" })
    vim.api.nvim_set_hl(0, "Identifier", { fg = "#E86F86" })

    -- Treesitter highlights for specific variables
    vim.api.nvim_set_hl(0, "@variable", { fg = "#E86F86" })
    vim.api.nvim_set_hl(0, "@namespace", { fg = "#E85349" })
    vim.api.nvim_set_hl(0, "@import", { fg = "#E85349" })

    -- custom colorcolumn color
    vim.api.nvim_set_hl(0, "ColorColumn", {
        ctermbg = "lightgrey",
        bg = "#444B6A"
    })

    -- ------------------------------------------------------------------------
    -- Markdown
    -- ------------------------------------------------------------------------
    vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", {
        fg = "#FF757F",
        bold = true 
    })
    vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", {
        fg = "#E0AF68",
        bold = true,
        italic = true
    })

    -- fallback for non-Treesitter markdown groups
    vim.api.nvim_set_hl(0, "markdownH1", {
        fg = "#FF757F",
        bold = true
    })
    vim.api.nvim_set_hl(0, "markdownH3", {
        fg = "#E0AF68",
        bold = true,
        italic = true
    })

end

-- ----------------------------------------------------------------------------
-- Apply highlights on ColorScheme change
-- ----------------------------------------------------------------------------

-- Create an autocommand group for highlights
local augroup = vim.api.nvim_create_augroup("jux_highlights", { clear = true })

-- Apply highlights whenever the colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
    group = augroup,
    callback = apply_highlights,
})

-- Call the function once to apply highlights immediately
apply_highlights()
