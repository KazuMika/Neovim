-- key mapping
local map = vim.keymap.set
local g = vim.g
g.mapleader = ","
map("i", "jj", "<ESC>", { silent = true, desc = "jj to ESC" })
map("i", "<leader>r", "<ESC>zza", { silent = true })
-- map("i", ";", ":", { noremap = true })
-- map("i", ":", ";", { noremap = true })
-- map("n", ";", ":", { noremap = true })
-- map("n", ":", ";", { noremap = true })
map("i", "-", "_", { noremap = true })
map("i", "_", "-", { noremap = true })
map("i", "<C-o>", "<ESC>o", { noremap = true })
map("i", "<C-a>", "<ESC>A", { noremap = true })
map("n", "<leader>w", ":w<cr>", { noremap = true })
map("n", "<leader>a", ":w!<cr>:qa!<cr>", { noremap = true })
map("n", "<leader>z", ":%s/<C-V><C-M>//g<cr>", { noremap = true })
map("n", "<leader>e", "<cmd>enew<cr>", { noremap = true })
map("n", "tt", "<cmd>tabnew<cr>", { noremap = true })
map("n", "th", "<cmd>tabfirst<cr>", { noremap = true })
map("n", "tj", "<cmd>tabprev<cr>", { noremap = true })
map("n", "tk", "<cmd>tabnext<cr>", { noremap = true })
map("n", "tl", "<cmd>tablast<cr>", { noremap = true })
vim.cmd [[ tmap <Esc> <c-\><c-n> ]]
map("n", "<leader>g", "<cmd>cd %:h <CR>", { noremap = true })
map("i", "<C-f>", "<Right>", { noremap = true })
map("n", "<leader>''", "<cmd>Telescope find_files<cr>", { noremap = true })
map("n", "<leader>':", "<cmd>Telescope live_grep<cr>", { noremap = true })
map("n", "<leader>'[", "<cmd>Telescope bufferes<cr>", { noremap = true })

map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
-- map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "<leader>rt", "<cmd>NvimTreeResize 70<cr>", { noremap = true })
map("n", "<leader>tr", "<cmd>NvimTreeResize 30<cr>", { noremap = true })
map("n", "<leader>re", "<cmd>FloatermUpdate --height=1.0<cr>", { noremap = true })
map("n", "<leader>er", "<cmd>FloatermUpdate --height=0.2<cr>", { noremap = true })

-- map('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
-- map('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map("n", "<C-j>", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<C-k>", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

map("i", "<C-b>", "<ESC>^i", { noremap = true }) -- Beginning of line
map("i", "<C-e>", "<End>", { noremap = true }) -- End of line

map("n", "<Esc>", ":noh <cr>", { noremap = true }) -- Clear highlights
map("n", "<C-s>", "<cmd> w <CR>", { noremap }) -- savefile

-- luaSnip
