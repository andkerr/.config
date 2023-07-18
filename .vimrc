" ############# MAPPINGS #############

let mapleader=" " " lead mappings with a space

" press space to un-highlight search results
nnoremap <leader>n :let @/=""<CR>

" 'pedagoic' mappings --> don't use arrow keys
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" ############# PLUGINS #############

call plug#begin()

Plug 'dense-analysis/ale', { 'tag': 'v3.3.0' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'morhetz/gruvbox'

Plug 'machakann/vim-highlightedyank'

call plug#end()

let g:ale_enabled=0

let g:airline_theme='gruvbox'
let g:airline#extenstions#ale#enabled=0

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set background=light
colorscheme gruvbox

let g:highlightedyank_highlight_duration = 500

" ############# INDENTATION AND SPLITS #############

set cursorline
set autoindent " continue (?) current indentation level on <Enter>
set smartindent

set colorcolumn=80

set shiftwidth=4
set tabstop=4
set softtabstop=0
set smarttab
set expandtab

set splitbelow " open new split panes down and to the right
set splitright
set tabpagemax=100

" ############# MISCELLANEOUS #############

" html file specifics (htmldjango covers .html files
" that incorporate Jinja template features)
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType htmldjango setlocal shiftwidth=2 softtabstop=2 expandtab

set showcmd " Display previous command in bottom bar
set wildmenu " visual autocomplete for command menu

set mouse=a " enable mouse support

set hlsearch " highlight all results
set ignorecase " ignore case in search
set incsearch " show search results as you type

set hidden " allow a buffer that has unsaved changes to be hidden

" automatically wrap text at 80 chars for .txt files
au BufRead,BufEnter *.txt set tw=79

set clipboard=unnamedplus
