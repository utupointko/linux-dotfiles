" #########################################################
"
"
"                ██╗   ██╗██╗███╗   ███╗
"                ██║   ██║██║████╗ ████║
"                ╚██╗ ██╔╝██║██╔████╔██║
"                 ╚████╔╝ ██║██║╚██╔╝██║
"                  ╚██╔╝  ██║██║ ╚═╝ ██║
"                   ╚═╝   ╚═╝╚═╝     ╚═╝
" 
"   config by @utupointko - © 2020 Arslan Abdizhalilov
"
" #########################################################





" =========================================================
" GENERAL SETTINGS
" =========================================================

set t_Co=256
set nocompatible
filetype indent plugin on
syntax on
set noswapfile

set hidden
set wildmenu
set smartcase
set hlsearch
set showcmd

set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent noexpandtab tabstop=4 shiftwidth=4
set laststatus=2
set number
set mousemodel=popup

set shiftwidth=4
set expandtab
set tabstop=4

let mapleader=","

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" =========================================================
" HOTKEYS
" =========================================================

map <C-Up> :tabr<cr>
map <C-Down> :tabl<cr>
map <C-Left> :tabp<cr>
map <C-Right> :tabn<cr>

map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>

" =========================================================
" PLUGINS
" =========================================================

call plug#begin('~/.vim/plugged')
   
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'jmcantrell/vim-virtualenv'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'dylanaraps/wal.vim'

call plug#end()

" =========================================================
" ONEHALFDARK THEME
" =========================================================

colorscheme onehalfdark
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let g:airline_theme='onehalfdark'

" =========================================================
" AIRLINE
" =========================================================

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" =========================================================
" NERDTREE
" =========================================================

map <C-e> :NERDTreeToggle<CR>
