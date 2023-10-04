require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

-- key mapping
-- 
local g = vim.g
g.mapleader = ","
local map = vim.keymap.set
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("i", "jj", "<ESC>",  { silent = true, desc = "jj to ESC" })
map("i", "zz", "<ESC>zza",  { silent = true})
map("i", ";", ":",{noremap = true})
map("i", ":", ";",{noremap = true})
map("n", ";", ":",{noremap = true})
map("n", ":", ";",{noremap = true})
map("i", "-", "_",{noremap = true})
map("i", "_", "-",{noremap = true})
map("i", "<C-o>", "<ESC>o",{noremap = true})
map("i", "<C-a>", "<ESC>A",{noremap = true})
map("n", "<leader>w", ":w",{noremap = true})
map("n", "<leader>a", ":qa!",{noremap = true})
map("n", "<leader>e", "<cmd>enew",{noremap = true})


local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

