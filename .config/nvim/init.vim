set number " enable line numbers
set relativenumber " enable relative line numbers

set colorcolumn=79 " mark 79 char. limit
set cursorline
set softtabstop=4 " Backspace following tab rmvs. all 4 white spaces

set autoindent " continue (?) current indentation level on <Enter>
set shiftwidth=2
set expandtab " insert tabs as whitespaces

set showcmd " Display previous command in bottom bar
set wildmenu " visual autocomplete for command menu

set mouse=a " enable mouse support

set hlsearch " highlight all results
set ignorecase " ignore case in search
set incsearch " show search results as you type

set splitbelow " open new split panes down and to the right
set splitright

colorscheme gruvbox " enable for softbackground and font colours

set hidden " allow a buffer that has unsaved changes to be hidden

" automatically wrap text at 80 chars for .txt files
au BufRead,BufEnter *.txt set tw=79

" ############# MAPPINGS #############

let mapleader="." " lead mappings with a period

" exit insert mode from home row
inoremap jk <ESC>
inoremap kj <ESC>

" press space to un-highlight search results
nnoremap <leader><space> :let @/=""<CR>

inoremap <leader><CR> <CR><C-o>k<C-o>$<CR>

" 'pedagoic' mappings --> don't use arrow keys
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
