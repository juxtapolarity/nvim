-- after/plugin/nvim-dap.lua
local dap = require('dap')

-- Configure DAP adapters and configurations
-- dap.adapters.python = {
--   type = 'executable',
--   command = 'python',
--   args = { '-m', 'debugpy.adapter' },
-- }
-- Configure DAP adapters for Python
dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    -- For attach requests, define the adapter as a server
    local port = (config.connect or config).port
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = (config.connect or config).host or '127.0.0.1',
      enrich_config = enrich_config,
      options = {
        source_filetype = 'python',
      }
    })
  else
    -- For launch requests, define the adapter as an executable
    cb({
      type = 'executable',
      command = 'python',
      args = { '-m', 'debugpy.adapter' },
      enrich_config = enrich_config,
      options = {
        source_filetype = 'python',
      }
    })
  end
end

-- Configure DAP configurations for Python
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return 'python'
    end,
    console = "integratedTerminal",  -- Use integrated terminal to avoid popup
  },
  {
    type = 'python',
    request = 'attach',
    name = "Attach to process",
    connect = {
      port = 38000,  -- The port you use in debugpy.listen()
      host = "127.0.0.1",  -- Default to localhost
    },
    pythonPath = function()
      return 'python'
    end,
    console = "integratedTerminal",  -- Use integrated terminal to avoid popup
  }
}
-- dap.configurations.python = {
--   {
--     type = 'python',
--     request = 'launch',
--     name = "Launch file",
--     program = "${file}",
--     pythonPath = function()
--       return 'python'
--     end,
--     console = "integratedTerminal",  -- Use integrated terminal to avoid popup
--   },
-- }

-- REPL
vim.keymap.set('n', '<leader>dr', function()
    require("dap").repl.toggle()
end, { desc = "Toggle REPL" })

require("cmp").setup({
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        or require("cmp_dap").is_dap_buffer()
  end
})

require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
})

-- vim.fn.sign_define('DapBreakpoint',
--     {
--         text='🔴', -- nerdfonts icon here
--         texthl='DapBreakpointSymbol',
--         linehl='DapBreakpoint',
--         numhl='DapBreakpoint'
--     })
-- vim.fn.sign_define('DapStopped',
--     {
--         text='', -- nerdfonts icon here
--         texthl='DapStoppedSymbol',
--         linehl='DapBreakpoint',
--         numhl='DapBreakpoint'
--     })

