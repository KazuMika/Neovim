require('ale').setup()
local map = vim.keymap.set
map("n", "<C-k>", "<Plug>(ale_previous_warp)<cr>",{silent = true})
map("n", "<C-j>", "<Plug>(ale_next_warp)<cr>",{silent = true})

