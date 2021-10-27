set number " enable line numbers
if !exists("g:syntax_on") " Enable syntax highlighting, only once
    syntax enable
endif
set colorcolumn=80 " mark 80 char. limit
set cursorline
set softtabstop=4 " Backspace following tab rmvs. all 4 white spaces

set autoindent " continue (?) current indentation level on <Enter>
set shiftwidth=4
set expandtab " insert tabs as whitespaces

set showcmd " Display previous command in bottom bar
set wildmenu " visual autocomplete for command menu

colorscheme molokai

set mouse=a " enable mouse support

set hlsearch " highlight all results
set ignorecase " ignore case in search
set incsearch " show search results as you type


let mapleader="," " lead mappings with a comma

" exit insert mode from home row
inoremap jk <ESC>
inoremap kj <ESC>

" press space to un-highlight search results
nnoremap <leader><space> :let @/=""<CR>

inoremap <leader><CR> <CR><C-o>k<C-o>$<CR>

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" vim-airline - display a status bar at the bottom of your window
Plug 'vim-airline/vim-airline'
" vim-airline-themes
Plug 'vim-airline/vim-airline-themes'
" sytastic - syntax checking
Plug 'scrooloose/syntastic'
" NERD tree - file tree browsing in Vim
Plug 'scrooloose/nerdtree'
" deliminate - smart bracket and quote completion
Plug 'raimondi/delimitmate'
" trailing-whitespace - highlights and allows for quick removal of whitespace
Plug 'bronson/vim-trailing-whitespace'

call plug#end()

" ######### Syntastic - Plugin Settings #########

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Werror -pedantic"

" ######### vim-airline-themes - Plugin Settings #########

let g:airline_theme='powerlineish'
