
-- require("vim-floaterm").setup{}
local g = vim.g
local map = vim.keymap.set
-- g.floaterm_width = 70
g.floaterm_height = 10
-- g.floaterm_wintype = 'float'
g.floaterm_wintype = 'split'
-- If wintype is split/vsplit: 'leftabove', 'aboveleft', 'rightbelow', 'belowright', 'topleft', 'botright'. Default: 'botright'.
g.floaterm_position = 'botright'
map("n", "dn", "<cmd>FloatermNew<cr>",{noremap = true})
map("n", "dk", "<cmd>FloatermNext<cr>",{noremap = true})
map("n", "df", "<cmd>FloatermToggle<cr>",{noremap = true})

