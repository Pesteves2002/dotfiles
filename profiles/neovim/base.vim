" set spaces and tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

" show invisible whitespace characters
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

" delete trailing whitespace
autocmd FileType c,cpp,java,lua,nix,vim autocmd BufWritePre <buffer> %s/\s\+$//e

" makes n=Next and N=Previous for find (? / /)
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

" keep undo history over different sessions
set undofile
set undodir = "/tmp//"

" change leader key to space bar
let mapleader = " "

" add sign column
set signcolumn=yes

" avoiding W
cabbrev W w

" add relative number column
set number
set relativenumber

" text does not wrap
set nowrap

" does not allow the cursor to go above or below
set scrolloff=8

" enable highlighting of search results
set hlsearch

" ignore case when searching, unless an uppercase letter is used
set ignorecase
set smartcase

" incremental search, highlight matches as you type
set incsearch

" show the cursor position at all times
set ruler

" show matching brackets when cursor is over them
set showmatch

" enable exclusive selection for visual mode
set selection=exclusive

" enable mouse support in all modes
set mouse=a

" open new split windows below and to the right of the current window
set splitbelow
set splitright

