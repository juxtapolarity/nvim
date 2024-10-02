local okascii, ascii = pcall(require, 'ascii.art')
local ok, db = pcall(require, 'dashboard')
if ok then
    db.setup({
        theme = 'doom',
        config = {
          header = {
	[[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
          },
          center = {
             {
               icon = ' ',
               icon_hl = 'Title',
               desc = 'Telescope find_files',
               desc_hl = 'String',
               key = 'f',
               keymap = '<leader>ff',
               key_hl = 'Number',
               key_format = ' %s', -- remove default surrounding `[]`
               action = 'lua print(2)'
             },
             {
               icon = ' ',
               desc = 'Find Dotfiles',
               key = '.',
               keymap = 'SPC f d',
               key_format = ' %s', -- remove default surrounding `[]`
               action = 'lua print(3)'
             },
          },
          footer = {}  --your footer
        }
      })
else
    vim.notify('Failed to load dashboard.nvim', vim.log.levels.ERROR)
end
