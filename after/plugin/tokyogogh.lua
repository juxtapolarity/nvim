require('tokyogogh').setup {
  style = 'night', -- storm | night
  term_colors = true,
	-- Change code styles
	code_styles = {
		strings = { italic = false, bold = false },
		comments = { italic = true, bold = false },
		functions = { italic = false, bold = false },
		variables = { italic = false, bold = false },
	},
	diagnostics = {
		undercurl = true, -- use undercurl instead of underline
		background = true,
	},
  -- Customization
  colors = {},
  highlights = {},
}

-- Apply custom highlights
vim.cmd([[highlight Function guifg=#ad60f4]])
vim.cmd([[highlight Type guifg=#ad60f4]])
vim.cmd([[highlight pythonDocstring guifg=#444B6A]])
vim.cmd([[highlight String guifg=#ad8ee6]])
vim.cmd([[highlight Identifier guifg=#444B6A]])
