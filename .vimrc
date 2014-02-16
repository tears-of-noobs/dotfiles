set nocompatible
filetype off
filetype plugin indent off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin on
filetype indent on


Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'jistr/vim-nerdtree-tabs'  
"""" Autocomplete for python 
"""" (You must install jedi lib to use this plugin)
Bundle 'davidhalter/jedi-vim'
"""" Move by TAB in autocomplete menu
Bundle 'ervandew/supertab'


syntax enable
set background=dark
colorscheme solarized

set history=500
set smartcase
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=2
set laststatus=2

let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:nerdtree_tabs_focus_on_files=1
let NERDTreeMapOpenInTab='\r'
let g:SuperTabDefaultCompletionType = "<c-n>"

"""" Syntastic python code checker 
"""" (You must install flake8 from pip to use it)
let g:syntastic_python_checkers=['flake8']

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop> 

"""" Open NERDtree by - '\m'
map <Leader>m <plug>NERDTreeTabsToggle<CR>

"""" Move over tabs by CTRL-PGUP CTRL-PGDOWN
nmap    <ESC>[5^    <C-PageUp>
nmap    <ESC>[6^    <C-PageDown>
nnoremap  <C-PageDown> :tabn<cr>
nnoremap  <C-PageUp> :tabp<cr>

"""" Move focus between window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l