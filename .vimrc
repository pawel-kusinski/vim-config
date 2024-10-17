set number        " Enable line numbers

" Tab settings
set expandtab      " Convert tabs to spaces
set tabstop=4      " Number of spaces for a tab
set shiftwidth=4   " Number of spaces for auto-indents
set softtabstop=4  " Number of spaces for a manual tab press

" Plugins

call plug#begin('~/.vim/plugged')

" List your plugins here
Plug 'preservim/nerdtree'         " Example: NERDTree plugin

call plug#end()
