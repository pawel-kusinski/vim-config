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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

nnoremap <C-p> :Files<Cr>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-s> :w<CR>

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

