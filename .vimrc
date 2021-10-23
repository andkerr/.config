" ######### Basics #########
set number " enable line numbers
if !exists("g:syntax_on") " Enable syntax highlighting, only once
    syntax enable
endif
set colorcolumn=80 " mark 80 char. limit
set cursorline
set tabstop=4 " Tabs are 4 white spaces wide
set softtabstop=4 " Backspace following tab rmvs. all 4 white spaces
set autoindent " continue (?) current indentation level on <Enter>
set expandtab " insert tabs as whitespaces

" ######### Window Layout #########
set showcmd " Display previous command in bottom bar
set wildmenu " visual autocomplete for command menu

" ######### Colours #########
colorscheme badwolf 
highlight ColorColumn ctermbg=25 guibg=lightgrey

" ######### Highlighting #########
set noswapfile " disable the swapfile
set hlsearch " highlight all results
set ignorecase " ignore case in search
set incsearch " show search results as you type

" ######### Remappings #########
let mapleader="," " lead mappings with a comma

" exit insert mode from home row
inoremap jk <ESC>
inoremap kj <ESC>

" press space to un-highlight search results
nnoremap <leader><space> :let @/=""<CR> 
