" .vimrc

" vundle plugin manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'hdima/python-syntax'
" Plugin 'ervandew/supertab'
" Plugin 'luochen1990/rainbow'

call vundle#end()

" syntax
let python_highlight_all = 1
filetype plugin indent on
syntax enable

" colors
set t_Co=256
set background=dark
highlight LineNr ctermfg=Grey

" searching
set hlsearch
set ignorecase
set smartcase

" indentation
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set pastetoggle=<F2>

" numbering
set number
set ruler

" keybindings
map ; :
map ' :!
map , :tabN<Enter>
map . :tabn<Enter>

" enable mouse in all modes; helps with tmux integration
set mouse=a

" tmux tile
autocmd BufEnter * call system("tmux rename-window".expand("%:t"))
autocmd BufEnter * let &titlestring = ''.expand("%:t")
set title
set titleold=bash

" Remember last place
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" rainbow parenthesis
let g:rainbow_active = 1 

" overwrite default python settings
function! SetupPython()
  setlocal softtabstop=2
  setlocal tabstop=2
  setlocal shiftwidth=2
endfunction

command! -bar SetupPython call SetupPython()
