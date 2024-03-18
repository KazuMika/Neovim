-- key mapping
local map = vim.keymap.set
local g = vim.g
g.mapleader = ","
map("i", "jj", "<ESC>",  { silent = true, desc = "jj to ESC" })
map("i", "zz", "<ESC>zza",  { silent = true})
map("i", "<C-f>", "<Right>",{noremap = true})
map("i", ";", ":",{noremap = true})
map("i", ":", ";",{noremap = true})
map("n", ";", ":",{noremap = true})
map("n", ":", ";",{noremap = true})
map("i", "-", "_",{noremap = true})
map("i", "_", "-",{noremap = true})
map("i", "<C-o>", "<ESC>o",{noremap = true})
map("i", "<C-a>", "<ESC>A",{noremap = true})
map("i", "<C-d>", "<ESC>Di",{noremap = true})
map("n", "<SHIFT-d>", "<ESC>Di",{noremap = true})
map("n", "<leader>a", ":qa!<cr>",{noremap = true})
map("n", "tt", "<cmd>tabnew<cr>",{noremap = true})
map("n", "th", "<cmd>tabfirst<cr>",{noremap = true})
map("n", "tj", "<cmd>tabprev<cr>",{noremap = true})
map("n", "tk", "<cmd>tabnext<cr>",{noremap = true})
map("n", "tl", "<cmd>tablast<cr>",{noremap = true})
vim.cmd([[ tmap <Esc> <c-\><c-n> ]]) 
map("n", "<leader>cd", "<cmd>cd %:h <CR>",{noremap = true})
map('n', "<leader>''", "<cmd>Telescope find_files<cr>", {noremap = true})
map('n', "<leader>':", "<cmd>Telescope live_grep<cr>", {noremap = true})
map('n', "<leader>rt", "<cmd>NvimTreeResize 70<cr>", {noremap = true})
map('n', "<leader>tr", "<cmd>NvimTreeResize 30<cr>", {noremap = true})
map("n", "dn", "<cmd>FloatermNew<cr>",{noremap = true})
map("n", "dk", "<cmd>FloatermNext<cr>",{noremap = true})
map("n", "df", "<cmd>FloatermToggle<cr>",{noremap = true})
map('n', "<leader>re", "<cmd>FloatermUpdate --height=1.0<cr>", {noremap = true})
map('n', "<leader>er", "<cmd>FloatermUpdate --height=0.2<cr>", {noremap = true})

map("i", "<C-b>", "<ESC>^i",{noremap = true}) -- Beginning of line
map("i", "<C-e>", "<End>",{noremap = true}) -- End of line

map("n", "<Esc>", ":noh <cr>", {noremap = true}) -- Clear highlights
map("n", "<C-s>", "<cmd> w <CR>", {noremap}) -- savefile
