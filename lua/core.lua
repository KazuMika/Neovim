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
--
--
-- g.ale_fix_on_save = 1
-- g.ale_lint_on_text_changed = 'never'
-- g.ale_lint_on_insert_leave = 0
-- 
-- g.ale_sign_error = '.'
-- g.ale_sign_warning = '.'
-- g.ale_echo_msg_format = '[%linter%]%code: %%s'
-- 
-- g.ale_linters = {python='flake8'}
-- 
-- g.ale_fixers = {python='autopep8'}
-- g.virtualenv_auto_activate = 1
-- g.python3_host_prog = '/home/k.mikami/.pyenv/versions/global310/bin/python3.10'
-- g.python_host_prog = '/home/k.mikami/.pyenv/versions/global310/bin/python3.10'
-- g.syntastic_python_flake8_args='--ignore=E501'

vim.cmd([[
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  let g:ale_fix_on_save = 1
  " Write this in your vimrc file
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_insert_leave = 0
  " You can disable this option too
  " if you don't want linters to run on opening a file
  
  let g:ale_sign_error = '.'
  let g:ale_sign_warning = '.'
  let g:airline#extensions#ale#open_lnum_symbol = '('
  let g:airline#extensions#ale#close_lnum_symbol = ')'
  let g:ale_echo_msg_format = '[%linter%]%code: %%s'
  
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
  
  let g:ale_linters = {
      \ 'python': ['flake8'],
      \}
  
  
  let g:ale_fixers = {
  \   'python': ['autopep8'],
  \   'javascript': ['eslint'],
  \}

  let g:virtualenv_auto_activate = 1
  let g:python3_host_prog = '/home/k.mikami/.pyenv/versions/global310/bin/python3.10'
  let g:python_host_prog = '/home/k.mikami/.pyenv/versions/global310/bin/python3.10'
  let g:syntastic_python_flake8_args='--ignore=E501'
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_completion_start_length = 1
  autocmd FileType python setlocal completeopt-=preview
  autocmd FileType python setlocal omnifunc=jedi#completions
  let g:SuperTabContextDefaultCompletionType = "context"
  let g:SuperTabDefaultCompletionType = "<c-n>"
  let g:deoplete#sources#jedi#server_timeout=100
  let g:deoplete#sources#jedi#statement_length=100
  let g:jedi#completions_enabled = 0
  let g:jedi#force_py_version = 3 
  let g:jedi#popup_on_dot = 1
  let g:jedi#goto_command = ""
  let g:jedi#goto_assignments_command = ""
  let g:jedi#goto_stubs_command = ""
  let g:jedi#goto_definitions_command = ""
  let g:jedi#documentation_command = "K"
  let g:jedi#usages_command = ""
  let g:jedi#completions_command = ""
  let g:jedi#rename_command = ""
  let g:jedi#rename_command_keep_name = ""
let g:airline#extensions#tabline#enabled = 1 " タブラインを表示

]])



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
map("i", "<C-f>", "<Right>",{noremap = true})

lvim.builtin.nvimtree.setup.view.mappings.list = { 
  {key = "f", action = "" },
}
