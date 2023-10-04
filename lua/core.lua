-- load lazy.nvim
-- encoding
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- visual
vim.o.ambiwidth = 'double'
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.visualbell = true
vim.o.number = true
vim.o.showmatch = true
vim.o.matchtime = 1

-- search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- manipulation
vim.g.mapleader = ' '
vim.opt.clipboard:append{'unnamedplus'}
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'

local g = vim.g
g.floaterm_width = 85
g.floaterm_height = 52
g.floaterm_wintype = 'float'
g.floaterm_position = 'topright'


-- key mapping
local map = vim.keymap.set
local g = vim.g
g.mapleader = ","
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
map("n", "<leader>e", "<cmd>enew<cr>",{noremap = true})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
