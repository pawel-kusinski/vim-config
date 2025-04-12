set relativenumber " Enable line numbers

" Tab settings
set expandtab      " Convert tabs to spaces
set tabstop=4      " Number of spaces for a tab
set shiftwidth=4   " Number of spaces for auto-indents
set softtabstop=4  " Number of spaces for a manual tab press

set colorcolumn=121

" Spell
set spell
set spellfile=~/.vim/spell/en.utf-8.add

set directory=~/.vim/swap//

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Plugins

call plug#begin('~/.vim/plugged')

" List your plugins here
Plug 'preservim/nerdtree'         " Example: NERDTree plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'

call plug#end()

nnoremap <C-p> :Files<Cr>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-l> :Ag<CR>
nnoremap <C-h> :set number! relativenumber!<CR>

" Normal mode scrolling
nnoremap <C-Down> <C-e> " Scroll down one line
nnoremap <C-j> <C-e>    " Scroll down one line
nnoremap <C-Up> <C-y>   " Scroll up one line
nnoremap <C-k> <C-y>    " Scroll up one line

" Insert mode scrolling
inoremap <C-Up> <C-o><C-y>
inoremap <C-Down> <C-o><C-e>

" Trim white spaces on save
autocmd BufWritePre * %s/\s\+$//e

" Colors
if filereadable(expand("~/.vim/plugged/vim-code-dark/colors/codedark.vim"))
    colorscheme codedark
else
    colorscheme default
endif

syntax on

