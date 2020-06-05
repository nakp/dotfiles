if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
endif

" Required:
if has('nvim')
  call plug#begin('~/.config/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'vim-scripts/AutoClose'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/grep.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'

"" UI
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"" Writing
Plug 'reedes/vim-pencil'
Plug 'junegunn/rainbow_parentheses.vim'

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Syntaxis
"Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'mechatroner/rainbow_csv'

" WebDev Bundle
Plug 'mattn/emmet-vim'

" Rails
Plug 'tpope/vim-rails'

" PHP Bundle
"Plug 'arnaud-lb/vim-php-namespace'
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
set cursorline
set number relativenumber
set updatetime=750

" Filetypes
autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype Jenkinsfile setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType jade setlocal ts=2 sts=2 sw=2 expandtab

au BufNewFile,BufRead Appfile set ft=ruby
au BufNewFile,BufRead Deliverfile set ft=ruby
au BufNewFile,BufRead Fastfile set ft=ruby
au BufNewFile,BufRead Gymfile set ft=ruby
au BufNewFile,BufRead Matchfile set ft=ruby
au BufNewFile,BufRead Snapfile set ft=ruby
au BufNewFile,BufRead Scanfile set ft=ruby
au BufNewFile,BufRead Podfile set ft=ruby

"" Tags
""tags=tags;

" Better Whitespace
let g:strip_whitespace_on_save = 1

" Airline
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
let g:airline_theme='base16'

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "⚠"

"" ALE
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'ruby': 'rubocop'}

noremap <leader>lf :ALEFix<CR>

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

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <leader>s :<C-u>e ~/.vimrc<CR>
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

"" Git
noremap <leader>ga :Gwrite<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gsh :Gpush<CR>
noremap <leader>gll :Gpull<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gd :Gvdiff<CR>
noremap <leader>gr :Gremove<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Buffers
noremap <leader>nn :bn<CR>
noremap <leader>bb :bp<CR>

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

if has("gui_running")
  set clipboard=unnamed
else
  let base16colorspace=256
endif
colorscheme base16-solarized-dark
set background=dark
hi Normal ctermbg=NONE

""ack/ag
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'rg %s --files'
let g:ctrlp_use_caching = 0

"" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
highlight! link NERDTreeFlags NERDTreeDir

"" Devicons
let g:webdevicons_enable = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderPatternMatching = 1

"" tagbar
nmap <F8> :TagbarToggle<CR>

"" emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"" Limelight
let g:limelight_default_coefficient = 0.7
noremap <silent> <leader>ll :Limelight!!<CR>

"" Goyo
map <silent> <F9> :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"" Pencil
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,md,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
