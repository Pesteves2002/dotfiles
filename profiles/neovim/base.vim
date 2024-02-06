set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

" delete trailing whitespace
autocmd FileType c,cpp,java,lua,nix,vim autocmd BufWritePre <buffer> %s/\s\+$//e

" makes n=Next and N=Previous for find (? / /)
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" Change leader key to space bar
let mapleader = " "

set signcolumn=yes

" Avoiding W
cabbrev W w

set number
set relativenumber

set nowrap

set scrolloff=5
