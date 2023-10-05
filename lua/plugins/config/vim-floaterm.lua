
-- require("vim-floaterm").setup{}
local g = vim.g
local map = vim.keymap.set
map("n", "dn", "<cmd>FloatermNew<cr>",{noremap = true})
map("n", "dk", "<cmd>FloatermNext<cr>",{noremap = true})
map("n", "df", "<cmd>FloatermToggle<cr>",{noremap = true})

g.floaterm_width = 85
g.floaterm_height = 52
g.floaterm_wintype = 'float'
g.floaterm_position = 'topright'
