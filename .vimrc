set number        " Enable line numbers

" Tab settings
set expandtab      " Convert tabs to spaces
set tabstop=4      " Number of spaces for a tab
set shiftwidth=4   " Number of spaces for auto-indents
set softtabstop=4  " Number of spaces for a manual tab press
set colorcolumn=121
set spell

" Colors
colorscheme habamax
syntax on

" Plugins

call plug#begin('~/.vim/plugged')

" List your plugins here
Plug 'preservim/nerdtree'         " Example: NERDTree plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

nnoremap <C-p> :Files<Cr>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-s> :w<CR>

