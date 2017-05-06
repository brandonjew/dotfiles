" syntax
filetype plugin indent on
syntax on

" searching
set hlsearch
set ignorecase
set smartcase

" indentation
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=indent,eol,start

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

" remember last place
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

" rainbow_parentheses plugin
let g:rainbow_active = 1 "0 to enable manually via :RainbowToggle
