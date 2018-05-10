set nocompatible
filetype off
filetype plugin indent off

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cespare/vim-toml'
Plug 'avakhov/vim-yaml'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'reconquest/vim-colorscheme'
Plug 'Shougo/Unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'ternjs/tern_for_vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'joonty/vdebug'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'davidhalter/jedi-vim'
Plug 'easymotion/vim-easymotion'
Plug 'w0rp/ale'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

call plug#end()

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

set completeopt=longest,menuone
set clipboard=unnamedplus


let g:airline_powerline_fonts = 1
let g:airline_theme='reconquest'

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"

let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = ''  " dynamically done for ft=python.
let g:jedi#goto_definitions_command = '<leader>g'  " dynamically done for ft=python.
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#rename_command = '<Leader>gR'
let g:jedi#usages_command = '<Leader>gu'
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1

" Unite/ref and pydoc are more useful.
let g:jedi#documentation_command = '<Leader>_K'
let g:jedi#auto_close_doc = 1

hi Error ctermfg=250 ctermbg=160 guifg=#bcbcbc guibg=#d70000
hi Todo ctermfg=015 ctermbg=202 guifg=#ffffff guibg=#ff5f00

hi link ALEErrorSign Error 
hi link ALEWarningSign Todo

let g:ale_linters = {
\   'go': ['gometalinter'],
\   'javascript': ['eslint'],
\   'python': ['pylint', 'flake8'],
\}

let g:ale_sign_error = 'EE'
let g:ale_sign_warning = 'WW'
let g:airline#extensions#ale#enabled = 1

let g:ale_set_loclist = 1
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 1
let g:ale_set_quickfix = 0

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1


let g:vdebug_options = {}

function! SetupDebug()
  let g:vdebug_options['ide_key']='PHPStorm'
  let g:vdebug_options['port']=9005
  let g:vdebug_options['breaks_on_open']=0
  let g:vdebug_options['server']='local_ip'
  let g:vdebug_options['path_maps']={'remote_path': 'local_path'}
endfunction
nmap <leader>xd :call SetupDebug()<cr>


inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop> 
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop> 

nnoremap <Leader>f :<C-u>Unite file<CR>
nnoremap <Leader>b :<C-u>Unite buffer<CR>

nnoremap <Leader>n :lnext<CR>
nnoremap <Leader>r :lprev<CR>

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

augroup js_settings
    au!
    autocmd FileType javascript,pug setl shiftwidth=2 softtabstop=2 tabstop=2 expandtab 
augroup end

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
