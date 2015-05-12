" Pathogen
execute pathogen#infect()

" Necesary  for lots of cool vim things
set nocompatible

" Indentation
filetype plugin indent on
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=4
set softtabstop=4

" Theme
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized 

" Syntax highlighting on by default
syntax on

" Backup directories
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Line numbering
set relativenumber
set number

" Ignore case for commands
set ignorecase

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" Use enter to add an empty line in normal mode
map <Enter> o<ESC>

" Space will toggle folds!
nnoremap <space> za

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Necessary for powerline to work
let $PYTHONPATH="/usr/lib/python3.4/site-packages" 

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Sudo permissions
cmap w!! w !sudo tee %

" Mouse support for casual tasks
set mouse=a

" Searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

" Save my pinky
nore ; :
nore , ;

" Copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Sane movement
nmap j gj
nmap k gk
