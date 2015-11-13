if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
endif

" Required:
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/AutoClose'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/grep.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim'

" Vim Shell
Plug 'Shougo/vimproc.vim', {
      \ 'do' : 'make',
      \ }

if v:version > 702
	Plug 'Shougo/vimshell.vim'
endif

"" Completion
Plug 'Shougo/neocomplete.vim'

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Syntaxis
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'

" WebDev Bundle
Plug 'mattn/emmet-vim'
" PHP Bundle
Plug 'arnaud-lb/vim-php-namespace'
Plug 'shawncplus/phpcomplete.vim'
Plug 'stephpy/vim-php-cs-fixer'

" Laravel
Plug 'xsbeats/vim-blade'

"" Do not distract me!
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Color
Plug 'chriskempson/base16-vim'

" Required:
call plug#end()

" Required:
filetype plugin indent on

runtime macros/matchit.vim


"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set modeline
set modelines=5

"" Map leader to ,
let mapleader="\<Space>"

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set binary
set ttyfast

"" Errors
set novisualbell                  " don't beep
set noerrorbells                " don't beep

"" Visual Settings
syntax enable
set number relativenumber
set updatetime=750

" Filetypes
autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType ruby setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType jade setlocal ts=2 sts=2 sw=2 expandtab

"" Tags
""tags=tags;

" Better Whitespace
let g:strip_whitespace_on_save = 1

" Airline
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev E e

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Windows

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" session management
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>


"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_use_caching = 0
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'

"" ag and ctrlp options (mixin rite)
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	set grepprg=ag\ --nogroup\ --nocolor
else
	let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
	let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
endif

if has("gui_running")
  set background=dark
  colorscheme base16-solarized
  if has("gui_macvim")
    set guifont=Source\ Code\ Pro\ for\ Powerline:h12
    set transparency=5
  endif
else
  colorscheme base16-monokai
endif

"" tagbar
nmap <F8> :TagbarToggle<CR>

"" emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"" Limelight
let g:limelight_default_coefficient = 0.7

"" Goyo
map <silent> <F9> :Goyo<CR>:GitGutterEnable<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"" Completion
" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

