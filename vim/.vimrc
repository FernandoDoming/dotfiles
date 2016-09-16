set number

set nocompatible              " be iMproved, required
filetype off                  " required

" Key mapping
let mapleader = ","
"" Window navigation
nmap <silent> <C-w> :wincmd k<CR>
nmap <silent> <C-s> :wincmd j<CR>
nmap <silent> <C-a> :wincmd h<CR>
nmap <silent> <C-d> :wincmd l<CR>
"" Buffer navigation
nmap <silent> <C-m> :bnext!<CR>
nmap <silent> <C-n> :bprevious!<CR>
"" Misc
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!  " Save as root with :W
command Wq :execute ':silent w !sudo tee % > /dev/null' | :edit! | :q  " Save as root and exit :Wq
map <C-k> :NERDTreeToggle<CR>
nmap <silent> <leader>m :call ToggleMouse()<CR>

let g:user_emmet_leader_key='<C-l>'

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
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'mhinz/vim-startify'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'

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
set expandtab		" Use spaces instead of tabs
set showmatch
set hlsearch
set incsearch
set title
set wildignore=*.swp,*.class
set encoding=utf-8
set autoindent
set cindent
set cursorline
set autoread
set history=10000
set scrolloff=3

" Alias
" ex command for toggling hex mode - define mapping if desired
command -bar Hex call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries 
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" Functions
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
