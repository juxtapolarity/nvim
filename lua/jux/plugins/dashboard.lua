local M = {}

local function startup_is_empty()
    if vim.g.started_with_stdin then
        return false
    end

    if vim.fn.argc() > 0 then
        return false
    end

    local buf = vim.api.nvim_get_current_buf()

    if vim.bo[buf].buftype ~= "" then
        return false
    end

    if vim.api.nvim_buf_get_name(buf) ~= "" then
        return false
    end

    if vim.api.nvim_buf_line_count(buf) ~= 1 then
        return false
    end

    local first = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] or ""
    if first ~= "" then
        return false
    end

    return true
end

local function make_footer()
    local v = vim.version()
    local nvim_version = string.format("NVIM v%d.%d.%d", v.major, v.minor, v.patch)

    local ok, stats = pcall(function()
        return require("lazy").stats()
    end)

    if ok then
        return {
            "",
            nvim_version,
            string.format(
                "Loaded %d/%d plugins in %.2f ms",
                stats.loaded,
                stats.count,
                stats.startuptime
            ),
        }
    end

    return {
        "",
        nvim_version,
    }
end

function M.setup()
    vim.schedule(function()
        if not startup_is_empty() then
            return
        end

        require("dashboard").setup({
            theme = "doom",
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
                center = {},
                footer = make_footer(),
                vertical_center = true,
            },
        })
    end)
end

return M
