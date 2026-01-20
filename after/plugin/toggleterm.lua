if vim.g.vscode then
    return
end

local ok, toggleterm = pcall(require, 'toggleterm')
if ok then
    toggleterm.setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
    })

    function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    local Terminal = require("toggleterm.terminal").Terminal

    local python = Terminal:new({ cmd = "python", hidden = true })
    function _PYTHON_TOGGLE()
        python:toggle()
    end

    local htop = Terminal:new({ cmd = "htop", hidden = true })
    function _HTOP_TOGGLE()
        htop:toggle()
    end

    -- Key mappings for toggleterm
    vim.api.nvim_set_keymap('n', '<leader>tt', ':ToggleTerm<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>tp', ':lua _PYTHON_TOGGLE()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>th', ':lua _HTOP_TOGGLE()<CR>', { noremap = true, silent = true })
else
    vim.notify('Failed to load toggleterm.nvim', vim.log.levels.ERROR)
end
