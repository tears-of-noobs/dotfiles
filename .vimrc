set nocompatible
filetype off
filetype plugin indent off
set rtp+=~/.vim/bundle/Vundle.vim
""set rtp+=/usr/share/go/misc/vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
""Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'  
"""" Move by TAB in autocomplete menu
"" Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
"" Plugin 'Blackrush/vim-gocode'
Plugin 'cespare/vim-toml'
Plugin 'hsanson/vim-android'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/seoul256.vim'

call vundle#end() 

filetype plugin on
filetype indent on


syntax enable
let g:seoul256_background = 233
colorscheme seoul256

set history=500
set smartcase
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=2
set laststatus=2

let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:nerdtree_tabs_focus_on_files=1
let NERDTreeMapOpenInTab='\r'
""" let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
nmap <F8> :TagbarToggle<CR>


"""" python-mode
let g:pymode_rope = 0
let g:pymode_rope_completion = 0

let g:go_fmt_command = "goimports"

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

let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Enter>']

augroup hilight_over_80
    au!
    au VimResized,VimEnter * set cc= | for i in range(80, &columns > 80 ? &columns : 80) | exec "set cc+=" . i | endfor
augroup end
