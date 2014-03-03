set nocompatible
filetype off
filetype plugin indent off
set rtp+=~/.vim/bundle/vundle/
set rtp+=/usr/share/go/misc/vim
call vundle#rc()

filetype plugin on
filetype indent on


Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'jistr/vim-nerdtree-tabs'  
"""" Move by TAB in autocomplete menu
Bundle 'ervandew/supertab'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'


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

"""" Python-mode
let g:python_folding = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0


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

augroup hilight_over_80
    au!
    au VimResized,VimEnter * set cc= | for i in range(80, &columns > 80 ? &columns : 80) | exec "set cc+=" . i | endfor
augroup end
