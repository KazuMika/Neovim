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
map("n", "<leader>w", ":w<cr>",{noremap = true})
map("n", "<leader>a", ":qa!<cr>",{noremap = true})
map("n", "<leader>z", ":%s/<C-V><C-M>//g<cr>",{noremap = true})
map("n", "<leader>e", "<cmd>enew<cr>",{noremap = true})
map("n", "tt", "<cmd>tabnew<cr>",{noremap = true})
map("n", "th", "<cmd>tabfirst<cr>",{noremap = true})
map("n", "tj", "<cmd>tabprev<cr>",{noremap = true})
map("n", "tk", "<cmd>tabnext<cr>",{noremap = true})
map("n", "tl", "<cmd>tablast<cr>",{noremap = true})
vim.cmd([[ tmap <Esc> <c-\><c-n> ]]) 
map("n", "<leader>cd", "<cmd>cd %:h <CR>",{noremap = true})
map("i", "<C-f>", "<Right>",{noremap = true})
map('n', "<leader>''", "<cmd>Telescope find_files<cr>", {noremap = true})
map('n', "<leader>':", "<cmd>Telescope live_grep<cr>", {noremap = true})
map('n', "<leader>'[", "<cmd>Telescope bufferes<cr>", {noremap = true})

-- map("i", "<C-h>", "<Left>",{noremap = true})
-- map("i", "<C-l>", "<Right>",{noremap = true})
-- map("i", "<C-j>", "<Down>",{noremap = true})
-- map("i", "<C-k>", "<Up>",{noremap = true}) 
map("i", "<C-b>", "<ESC>^i",{noremap = true}) -- Beginning of line
map("i", "<C-e>", "<End>",{noremap = true}) -- End of line

-- map("n", "<C-h>", "<C-w>h", {noremap = true}) -- window left
-- map("n", "<C-l>", "<C-w>l", {noremap = true}) -- window right
-- map("n", "<C-j>", "<C-w>j", {noremap = true}) -- window down
-- map("n", "<C-k>", "<C-w>k", {noremap = true}) -- window up
map("n", "<Esc>", ":noh <cr>", {noremap = true}) -- Clear highlights
map("n", "<C-s>", "<cmd> w <CR>", {noremap}) -- savefile
--     -- line numbers
--     ["<leader>n"] = { "<cmd> set nu! <CR>", "Toggle line number" },
--     ["<leader>rn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
-- 
--     -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
--     -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
--     -- empty mode is same as using <cmd> :map
--     -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
--     ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
--     ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
--     ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
--     ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
-- 
--     -- new buffer
--     ["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },
-- 
