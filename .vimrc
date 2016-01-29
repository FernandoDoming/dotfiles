set number

set nocompatible              " be iMproved, required
filetype off                  " required

" Key mapping
let mapleader = ","
"" Window navigation
nmap <silent> <leader>w :wincmd k<CR>
nmap <silent> <leader>s :wincmd j<CR>
nmap <silent> <leader>a :wincmd h<CR>
nmap <silent> <leader>d :wincmd l<CR>
"" Buffer navigation
nmap <silent> <leader>n :bnext<CR>
nmap <silent> <leader>p :bprevious<CR>
"" Misc
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!  " Save as root with :W
command Wq :execute ':silent w !sudo tee % > /dev/null' | :edit! | :q  " Save as root and exit :Wq
nmap <silent> <leader>m :call ToggleMouse()<CR>

" Pretty colors
set t_Co=256
colorscheme zenburn

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'mhinz/vim-startify'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

" Vimdiff config
if &diff
    colorscheme luna
    let g:airline_theme='luna'
endif

" Editor settings
syntax on
set tabstop=2
set showmatch
set hlsearch
set incsearch
set title
set wildignore=*.swp,*.class

" Functions
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc
