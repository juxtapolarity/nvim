
-- Show dashboard ONLY on an actually-empty start.
-- This prevents it from hijacking stdin buffers (e.g. `... | nvim`) and other startup flows.

local function startup_is_empty()
  -- If files were passed as args, don't show dashboard.
  if vim.fn.argc() > 0 then
    return false
  end

  local buf = vim.api.nvim_get_current_buf()

  -- If we're in any special buffer, don't show dashboard.
  if vim.bo[buf].buftype ~= "" then
    return false
  end

  -- Only show dashboard for an unnamed buffer.
  if vim.api.nvim_buf_get_name(buf) ~= "" then
    return false
  end

  -- Default empty buffer is exactly one empty line.
  if vim.api.nvim_buf_line_count(buf) ~= 1 then
    return false
  end
  local first = (vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] or "")
  if first ~= "" then
    return false
  end

  return true
end

if not startup_is_empty() then
  return
end



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
