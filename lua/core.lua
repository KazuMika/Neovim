-- load lazy.nvim
-- 
-- encoding
local g = vim.g
local map = vim.keymap.set
local o = vim.o
-- local autocmd = vim.api.nvim_create_autocmd 
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- visual
o.ambiwidth = 'double'
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true

o.number = true
o.showmatch = true
o.matchtime = 1

o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = true

g.mapleader = ' '
vim.opt.clipboard:append{'unnamedplus'}
o.ttimeout = true
o.ttimeoutlen = 50

o.undofile = true
o.undodir = vim.fn.stdpath('cache') .. '/undo'

o.tabstop=4
o.shiftwidth=4
o.smarttab = true
o.expandtab = true
o.ignorecase = true
o.incsearch = true
o.scrolloff=8
o.wildmenu = true
o.autochdir = true
o.number = true
-- o.mouse=a
o.autoread = true
o.tw=0
o.laststatus=2
o.showmatch =  true
-- o.whichwrap=b,s,[,],<,>
-- o.backspace=indent,eol,start
o.list = true
-- o.listchars=trail:.
o.timeoutlen=200

-- autocmd FileType text setlocal textwidth=0

-- ctrlp

g.ale_fix_on_save = 1
g.ale_lint_on_text_changed = 'never'
g.ale_lint_on_insert_leave = 0

g.ale_sign_error = '.'
g.ale_sign_warning = '.'
g.ale_echo_msg_format = '[%linter%]%code: %%s'



g.virtualenv_auto_activate = 1
g.python3_host_prog = '/home/k.mikami/.pyenv/versions/global310/bin/python3.10'
g.python_host_prog = '/home/k.mikami/.pyenv/versions/global310/bin/python3.10'
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
map("n", "<leader>e", "<cmd>enew<cr>",{noremap = true})
map("n", "tt", "<cmd>tabnew<cr>",{noremap = true})
map("n", "th", "<cmd>tabfirst<cr>",{noremap = true})
map("n", "tj", "<cmd>tabprev<cr>",{noremap = true})
map("n", "tk", "<cmd>tabnext<cr>",{noremap = true})
map("n", "tl", "<cmd>tablast<cr>",{noremap = true})
vim.cmd([[ tmap <Esc> <c-\><c-n> ]]) 
map("n", "<leader>cd", "<cmd>cd %:h <CR>",{noremap = true})
