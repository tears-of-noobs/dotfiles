set nocompatible
filetype off
filetype plugin indent off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'  
Plugin 'cespare/vim-toml'
Plugin 'hsanson/vim-android'
Plugin 'posva/vim-vue'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-pug'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'reconquest/vim-colorscheme'
Plugin 'Shougo/Unite.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end() 

filetype plugin on
filetype indent on


syntax enable
colorscheme reconquest
set background=dark

set number
set history=500
set smartcase
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=2
set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline_theme='reconquest'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '≡'

" vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"

let g:syntastic_c_include_dirs = [ '/usr/include' ]
let g:syntastic_php_checkers = ['php', 'phpmd']
"let g:nerdtree_tabs_focus_on_files=1
"let NERDTreeMapOpenInTab='<ENTER>'
"nmap <F8> :TagbarToggle<CR>
"

autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP


nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop> 

"""" Open NERDtree by - '\m'
map <Leader>m <plug>NERDTreeTabsToggle<CR>
nnoremap <Leader>f :<C-u>Unite file<CR>
nnoremap <Leader>b :<C-u>Unite buffer<CR>

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


let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Enter>']
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>


augroup hilight_over_80
    au!
    au VimResized,VimEnter * set cc= | for i in range(80, &columns > 80 ? &columns : 80) | exec "set cc+=" . i | endfor
augroup end

augroup js_settings
    au!
    autocmd FileType javascript,pug setl shiftwidth=2 softtabstop=2 tabstop=2 expandtab 
augroup end
