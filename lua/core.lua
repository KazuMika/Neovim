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

-- floaterm
local g = vim.g
g.floaterm_width = 85
g.floaterm_height = 52
g.floaterm_wintype = 'float'
g.floaterm_position = 'topright'

-- ctrlp
g.ctrlp_use_caching = 1
--g.ctrlp_cache_dir = 
g.ctrlp_clear_cache_on_exit = 0


g.ale_fix_on_save = 1
g.ale_lint_on_text_changed = 'never'
g.ale_lint_on_insert_leave = 0

g.ale_sign_error = '.'
g.ale_sign_warning = '.'
g.ale_echo_msg_format = '[%linter%]%code: %%s'



g.virtualenv_auto_activate = 1
g.python3_host_prog = '/Users/quantan/.pyenv/versions/global3.10/bin/python3.10'
g.python_host_prog = '/Users/quantan/.pyenv/versions/global3.10/bin/python3.10'
g.syntastic_python_flake8_args='--ignore=E501'


--g.deoplete.enable_at_startup = 1
--g.deoplete.auto_completion_start_length = 1
---- autocmd FileType python setlocal completeopt-=preview
---- autocmd FileType python setlocal omnifunc=jedi#completions
--g.SuperTabContextDefaultCompletionType = "context"
--g.SuperTabDefaultCompletionType = "<c-n>"
--g.
--g.deoplete.sources.jedi.server_timeout=100
--g.deoplete.sources.jedi.statement_length=100
--g.jedi.completions_enabled = 0
--g.jedi.force_py_version = 3 
--g.jedi.popup_on_dot = 1
--g.
--g.jedi.goto_command = ""
--g.jedi.goto_assignments_command = ""
--g.jedi.goto_stubs_command = ""
--g.jedi.goto_definitions_command = ""
--g.jedi.documentation_command = "K"
--g.jedi.usages_command = ""
--g.jedi.completions_command = ""
--g.jedi.rename_command = ""
--g.jedi.rename_command_keep_name = ""




-- key mapping
local map = vim.keymap.set
g.mapleader = ","
map("i", "jj", "<ESC>",  { silent = true, desc = "jj to ESC" })
map("i", "zz", "<ESC>zza",  { silent = true})
-- map("i", ";", ":",{noremap = true})
-- map("i", ":", ";",{noremap = true})
-- map("n", ";", ":",{noremap = true})
-- map("n", ":", ";",{noremap = true})
map("i", "-", "_",{noremap = true})
map("i", "_", "-",{noremap = true})
map("i", "<C-o>", "<ESC>o",{noremap = true})
map("i", "<C-a>", "<ESC>A",{noremap = true})
map("n", "<leader>w", ":w",{noremap = true})
map("n", "<leader>a", ":qa!",{noremap = true})
map("n", "<leader>e", "<cmd>enew<cr>",{noremap = true})
map("n", "tt", "<cmd>tabnew<cr>",{noremap = true})
map("n", "th", "<cmd>tabfirst<cr>",{noremap = true})
map("n", "tj", "<cmd>tabprev<cr>",{noremap = true})
map("n", "tk", "<cmd>tabnext<cr>",{noremap = true})
map("n", "tl", "<cmd>tablast<cr>",{noremap = true})
map("n", "dn", "<cmd>FloatermNew<cr>",{noremap = true})
map("n", "dk", "<cmd>FloatermNext<cr>",{noremap = true})
map("n", "df", "<cmd>FloatermToggle<cr>",{noremap = true})
map("n", "<leader>,", "<cmd>CtrlPMRU<cr>",{noremap = true})
map("n", "<leader>f", "<cmd>CtrlP<cr>",{noremap = true})
map("n", "<leader>b", "<cmd>CtrlPBuffer<cr>",{noremap = true})
map("n", "<C-k>", "<Plug>(ale_previous_warp)<cr>",{silent = true})
map("n", "<C-j>", "<Plug>(ale_next_warp)<cr>",{silent = true})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
