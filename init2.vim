"le_recdein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let $PATH = "~/.pyenv/shims:".$PATH
" Required:

let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif

if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim,~/.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('~/.config/nvim')

if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

  "-------------------------------------------
  " plugins
  "-------------------------------------------

  call dein#add('vim-denops/denops.vim')
  call dein#add('Shougo/ddu.vim')
  call dein#add('honza/vim-snippets')
  call dein#add('davidhalter/jedi-vim', {'merged': 0,})
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('w0rp/ale')
  call dein#add('lepture/vim-jinja')
  call dein#add('nvim-lua/plenary.nvim')
  call dein#add('nvim-telescope/telescope.nvim', { 'rev': '0.1.3' })
  call dein#add('nvim-telescope/telescope-file-browser.nvim')
  call dein#add('nvim-telescope/telescope-frecency.nvim')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('jmcantrell/vim-virtualenv')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('ervandew/supertab')
  call dein#add('ConradIrwin/vim-bracketed-paste')
  call dein#add('tpope/vim-fugitive')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('voldikss/vim-floaterm')
  call dein#add('akinsho/toggleterm.nvim')
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
lua require("toggleterm").setup()

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------
colorscheme molokai
if !has('nvim')
  :pythonx import neovim
endif

"-------------------------------------------
" telescope config
"-------------------------------------------
lua require("telescope").setup{}


"-------------------------------------------
" neovim configuration 
"-------------------------------------------

set ambiwidth=double
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set imdisable
autocmd FileType text setlocal textwidth=0
set ignorecase
set incsearch
set nohlsearch
set encoding=utf-8
set notitle
set scrolloff=8
set wildmenu
set wildmode=longest:full,full
set autochdir

set number
set noswapfile
set noundofile
set nobackup
set mouse=a
set autoread
set tw=0

set laststatus=2
set showmatch
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set list
set listchars=trail:.
set timeoutlen=200
set clipboard=unnamedplus

"-------------------------------------------
" neosnippet
"-------------------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"------------------------------------
" undo-enable
"------------------------------------
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

"------------------------------------
" NERDTree
"------------------------------------

let NERDTreeShowBookmarks=1
let g:NERDTreeWinSize=25
nnoremap <C-n> :NERDTreeToggle<CR>


"------------------------------------
" ale
"------------------------------------

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

"------------------------------------
" Cursor
"------------------------------------
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"




if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

"------------------------------------
" python env configuration
"------------------------------------
"
let g:virtualenv_auto_activate = 1
let g:python3_host_prog = '/home/k.mikami/.pyenv/versions/global310/bin/python3.10'
let g:python_host_prog = '/home/k.mikami/.pyenv/versions/global310/bin/python3.10'
let g:syntastic_python_flake8_args='--ignore=E501'

"------------------------------------
" jedi configuration
"------------------------------------

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

"------------------------------------
" airline configuration, a bar tools
"------------------------------------

let g:airline_theme = 'hybridline'               " テーマの指定
let g:airline#extensions#tabline#enabled = 1 " タブラインを表示
"let g:airline_powerline_fonts = 1            " Powerline Fontsを利用

"------------------------------------
" crlp configuration, a bar tools
"------------------------------------

let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
set wildignore+=*/tmp/*,*.png,*.json,*.zip

"------------------------------------
" vim-floaterm configuretion
"------------------------------------
"let g:floaterm_title
let g:floaterm_width = 85
let g:floaterm_height = 52
"let g:floaterm_opener
let g:floaterm_wintype = 'float'
let g:floaterm_position = 'topright'
"let g:floaterm_autoclose
"let g:floaterm_borderchars
"let g:floaterm_titleposition

"------------------------------------
" Key-map
"------------------------------------
let mapleader = "\,"
inoremap <C-o> <ESC>o
inoremap <C-a> <ESC>A
inoremap - _
inoremap _ -
inoremap <C-f>   <Right>
nnoremap <Leader>w :w<CR>
"nnoremap <Leader>a :qa!<CR>
inoremap <silent> zz <ESC>zza
inoremap <silent> jj <ESC>
inoremap : ;
inoremap ; :
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :
nnoremap <leader>e <cmd>enew<cr>


"------------------------------------
" Key-map:CTrlP
"------------------------------------
nnoremap <leader>, <cmd>CtrlPMRU<cr>
nnoremap <leader>f <cmd>CtrlP<cr>
nnoremap <leader>b <cmd>CtrlPBuffer<cr>
nnoremap <leader>c <cmd>CtrlPClearCache<cr>

"------------------------------------
" Key-map:Telescope
"------------------------------------
nnoremap <leader>m <cmd>Telescope oldfiles<cr>
nnoremap <leader>j <cmd>Telescope find_files<cr>
nnoremap <leader>h <cmd>Telescope live_grep<cr>
nnoremap <leader>k <cmd>Telescope keymaps<cr>
nnoremap <leader>j <cmd>Telescope file_browser<CR>
"nnoremap <leader>b <cmd>Telescope buffers<cr>

"------------------------------------
" Key-map:Deol
"------------------------------------
nnoremap df <cmd>FloatermToggle<cr>
nnoremap dn <cmd>FloatermNew<cr>
nnoremap dk <cmd>FloatermNext<cr>

"------------------------------------
" Key-map:vim-floaterm
"------------------------------------
" nnoremap df <cmd>Deol -split=floating -winheight=35 -winwidth=180<cr>
tnoremap <C-[> <C-\><C-n>

"------------------------------------
" Key-map:tabnew
"------------------------------------
nnoremap tt  :tabnew<CR>
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tablast<CR>
"nnoremap t  :tabnext<Space>
"nnoremap tm  :tabm<Space>
"nnoremap tt  :tabedit<Space>

