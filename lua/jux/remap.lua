-- vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- When using ssh: use the tmux clipboard
-- vim.g.clipboard = {
--   name = "OSC 52",
--   copy = {
--     ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--   },
--   paste = {
--     ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
-- }
--   },
-- Smart clipboard provider:
-- 1) Wayland  -> wl-clipboard
-- 2) X11      -> xclip
-- 3) Headless/SSH/tmux -> OSC52

local function has(cmd) return vim.fn.executable(cmd) == 1 end
local has_display = (vim.env.DISPLAY and #vim.env.DISPLAY > 0)
                 or (vim.env.WAYLAND_DISPLAY and #vim.env.WAYLAND_DISPLAY > 0)
local on_ssh = (vim.env.SSH_CONNECTION and #vim.env.SSH_CONNECTION > 0)
            or (vim.env.SSH_TTY and #vim.env.SSH_TTY > 0)

local function use_osc52()
  local ok, osc = pcall(require, "vim.ui.clipboard.osc52")
  if ok then
    vim.g.clipboard = {
      name = "OSC 52",
      copy  = { ["+"] = osc.copy("+"),  ["*"] = osc.copy("*") },
      paste = { ["+"] = osc.paste("+"), ["*"] = osc.paste("*") },
    }
    return true
  end
  return false
end

if has_display then
  -- Prefer Wayland if available
  if vim.env.WAYLAND_DISPLAY and has("wl-copy") and has("wl-paste") then
    vim.g.clipboard = {
      name = "wl-clipboard",
      copy  = { ["+"] = "wl-copy --foreground --type text/plain", ["*"] = "wl-copy --foreground --primary --type text/plain" },
      paste = { ["+"] = "wl-paste --no-newline",                 ["*"] = "wl-paste --no-newline --primary" },
      cache_enabled = 1,
    }
  -- Otherwise use X11 xclip
  elseif has("xclip") then
    vim.g.clipboard = {
      name = "xclip",
      copy  = { ["+"] = "xclip -selection clipboard", ["*"] = "xclip -selection primary" },
      paste = { ["+"] = "xclip -o -selection clipboard", ["*"] = "xclip -o -selection primary" },
      cache_enabled = 1,
    }
  else
    -- Display exists but no clipboard utilities -> fall back to OSC52
    if not use_osc52() then
      vim.notify("No clipboard tool found; OSC52 module missing", vim.log.levels.WARN)
    end
  end
else
  -- No display (SSH/headless/tmux) -> OSC52
  if not use_osc52() then
    vim.notify("Headless but OSC52 module not available; clipboard disabled", vim.log.levels.WARN)
  end
end

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

-- reselect line after indentation
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Embrace vim: remap arrow keys
-- vim.keymap.set("n", "<Up>", "k", { noremap = true, silent = true })
-- vim.keymap.set("n", "<Down>", "j", { noremap = true, silent = true })
-- vim.keymap.set("n", "<Left>", "h", { noremap = true, silent = true })
-- vim.keymap.set("n", "<Right>", "l", { noremap = true, silent = true })
-- vim.keymap.set("v", "<Up>", "k", { noremap = true, silent = true })
-- vim.keymap.set("v", "<Down>", "j", { noremap = true, silent = true })
-- vim.keymap.set("v", "<Left>", "h", { noremap = true, silent = true })
-- vim.keymap.set("v", "<Right>", "l", { noremap = true, silent = true })
-- vim.keymap.set("i", "<Up>", "<C-o>k", { noremap = true, silent = true })
-- vim.keymap.set("i", "<Down>", "<C-o>j", { noremap = true, silent = true })
-- vim.keymap.set("i", "<Left>", "<C-o>h", { noremap = true, silent = true })
-- vim.keymap.set("i", "<Right>", "<C-o>l", { noremap = true, silent = true })

-- Map Ctrl+direction to window navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Map <leader>v to enter visual block mode
-- Map <leader>v to enter visual block mode
vim.keymap.set('n', '<leader>v', '<C-v>', { noremap = true, silent = true })


