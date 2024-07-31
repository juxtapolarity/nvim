-- after/plugin/nvim-dap.lua
local dap = require('dap')

-- Configure DAP adapters and configurations
dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}

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
}

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

