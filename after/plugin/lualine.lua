-- check if VSCode exists
if vim.g.vscode then
    return
end

vim.defer_fn(function()
    -- custom color theme
    local custom_ayu_mirage = require'lualine.themes.auto'
    custom_ayu_mirage.normal.a.bg = '#7AA2F7'
    custom_ayu_mirage.insert.a.bg = '#E0AF68'
    custom_ayu_mirage.visual.a.bg = '#9ECE6A'
    custom_ayu_mirage.command.a.bg = '#ad60f4'

    -- DAP status function
    local dap_status = {
      function()
        local dap = require('dap')
        if dap.session() then
          return ' Debugging'
        else
          return ''
        end
      end,
      color = { fg = '#61afef', gui = 'bold' },
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = custom_ayu_mirage,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename', dap_status},
        lualine_x = {{ 'swenv', icon = '' },'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
end, 0)

