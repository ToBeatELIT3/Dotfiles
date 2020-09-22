syntax on 
filetype on

set number
set noshowmode
set autoindent
set noswapfile
set nomodeline
set laststatus=2
set shiftwidth=4
set background=dark
set incsearch
set shell=/usr/bin/fish

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
":CocInstall coc-git coc-pairs coc-json coc-css coc-html coc-tsserver
"coc-python coc-clangd
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'

call plug#end()

colorscheme nord
hi Normal guibg=NONE ctermbg=NONE

nnoremap <C-t> :below split<cr>:resize 10<cr>:terminal<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

inoremap jj <Esc>
tnoremap jj <C-\><C-n>
map <C-n> :NERDTreeToggle<CR>

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

