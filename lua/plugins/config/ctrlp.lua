--require('ctrlp').setup()
local g = vim.g
local map = vim.keymap.set
map("n", "<leader>,", "<cmd>CtrlPMRU<cr>",{noremap = true})
map("n", "<leader>f", "<cmd>CtrlP<cr>",{noremap = true})
map("n", "<leader>b", "<cmd>CtrlPBuffer<cr>",{noremap = true})
map("n", "<leader>c", "<cmd>CtrlPClearCache<cr>",{noremap = true})

g.ctrlp_use_caching = 1
--g.ctrlp_cache_dir = 
g.ctrlp_clear_cache_on_exit = 0
