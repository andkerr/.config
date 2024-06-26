let mapleader=" "
let maplocalleader=" "

" ############# PLUGINS #############

" automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if !empty(glob(data_dir . '/autoload/plug.vim')) " just in case auto-install failed
    call plug#begin()

    Plug 'alvan/vim-closetag'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'machakann/vim-highlightedyank'

    Plug 'morhetz/gruvbox'

    Plug 'tpope/vim-fugitive'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    call plug#end()

    if v:version <= 800 && !exists('##TextYankPost')
        nmap y <Plug>(highlightedyank)
        xmap y <Plug>(highlightedyank)
        omap y <Plug>(highlightedyank)
    endif
    let g:highlightedyank_highlight_duration = 500

    colorscheme gruvbox
    let g:airline_theme='gruvbox'
endif

" ############# INDENTATION, SPLITS, COLOURS #############

set modeline

set background=dark
syntax on

set nocursorline
set autoindent " continue (?) current indentation level on <Enter>
set smartindent

set colorcolumn=80

set textwidth=0 " don't wrap long lines by default

" various niceties for indenting with spaces
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=0
set smarttab

" open new split panes down and to the right
set splitbelow
set splitright
set tabpagemax=100

" ############# MAPPINGS #############

" un-highlight search results
nnoremap <leader>. :let @/=""<CR>
nnoremap <leader>cf :!clear && make %:p:h<CR>

" 'pedagoic' mappings --> don't use arrow keys
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" execute the current file

nnoremap <leader>r :!clear;%:p \| less<CR>

" ############# MISCELLANEOUS #############

autocmd FileType markdown setlocal textwidth=80 wrap

set showcmd " Display previous command in bottom bar
set wildmenu " visual autocomplete for command menu

set mouse=a " enable mouse support

set hlsearch " highlight all results
set nowrapscan " don't wrap around start/end of file when moving through search matches
set ignorecase " ignore case in search
set incsearch " show search results as you type

set hidden " allow a buffer that has unsaved changes to be hidden

set clipboard=unnamedplus " yank to system clipboard

autocmd BufWritePost * {
    if (executable('shellcheck') && &filetype == 'sh')
        !shellcheck -x --severity=info --exclude=1090,1091 <afile>
    endif
}
