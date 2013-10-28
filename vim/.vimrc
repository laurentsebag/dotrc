"
" Vim configuration file
"
" Tested on vim 7.3
" File location: ~/.vimrc
"
" Interesting links about vimrc:
"   http://stevelosh.com/blog/2010/09/coming-home-to-vim/
"   http://nvie.com/posts/how-i-boosted-my-vim/
"

" Use new features of vim
set nocompatible

" Use pathogen plugin manager
"execute pathogen#infect()

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on

  " Solarized colorscheme parameters
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  let g:solarized_contrast="high"
  let g:solarized_visibility="low"

  " Set the default colorscheme
  "colorscheme solarized
  colorscheme default
  "colorscheme slate
  "colorscheme torte

  " If using a dark background within the editing area and syntax highlighting
  " turn on this option as well
  set background=dark
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters and autowrap
  autocmd FileType text setlocal textwidth=78
  autocmd FileType markdown setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

  "" Map jsbeautifier for javascript files to ctrl+f
  "autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
else
  set autoindent " always set autoindenting on
endif " has("autocmd")

set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase  " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
set autowrite   " Automatically save before commands like :next and :make
set hidden      " Hide buffers when they are abandoned
set mouse=a     " Enable mouse usage (all modes)

" Let vim rename the terminal title
set title
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" I like 2 spaces for indenting
set shiftwidth=2
" I like 2 stops
set tabstop=2
" Spaces instead of tabs
set expandtab
" Always display line numbers
set number
" Always  set auto indenting on
set autoindent
" activate search highlighting
set hlsearch
" Set the replace command to replace all occurences on a line by default
set gdefault

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class

" Color the characters when line is too long
set colorcolumn=80

" Keep a persistent undo file, to undo when coming back to a file
set undofile
set undodir=/tmp

" Highlight the line where the cursor is
set cursorline

" Show invisible characters like tabs or trailing spaces
set list

" Change the characters representing tabs and trailing spaces
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" The leader key is set to "\" by default, but you can change it if you like
"" Set the leader key to be ","
"let mapleader = ","

" Use ";" as ":" for commands like saving, exiting.
nnoremap ; :

" press Space to turn off highlighting and clear any messages displayed
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>

" Quote words under cursor
nnoremap <leader>' viw <ESC>:'<,'>s,\%V.*\%V,'\0'<CR>:nohlsearch<Bar>:echo<CR>
nnoremap <leader>" viw <ESC>:'<,'>s,\%V.*\%V,"\0"<CR>:nohlsearch<Bar>:echo<CR>

" Comment code
nnoremap <leader>// :s,^\(\s*\)\(.*\),\1//\2<CR>:nohlsearch<Bar>:echo<CR>
" Uncomment code
nnoremap <leader>/ :s,^\(\s*\)//,\1<CR>:nohlsearch<Bar>:echo<CR>

" Open file explorer
"nnoremap <leader>e :NERDTreeToggle<CR>

" <leader>t to open tagbar window
"nnoremap <leader>t :TagbarToggle<CR>

" <leader>j to toggle jslint syntax checking
"nnoremap <leader>j :let g:JSLintHighlightErrorLine = !g:JSLintHighlightErrorLine
"  \ <Bar>:JSLintUpdate<CR><CR>

" Appends 'user strict'; after the current line, used for javascript
"nnoremap <leader>u o'use strict';<ESC>

" Replace all tabs by spaces, remove trailing white spaces and add a space
" after commas.
nnoremap <leader>w :%s,\t,  ,<CR>:%s, *$,,<CR>:%s/,\</, /<CR>
  \ :nohlsearch
  \ <Bar>:echo "Cleaned whitespaces"<CR>

" Go down and up on long lines without skipping to the next line
nnoremap j gj
nnoremap k gk

" Use j or k typed two times to come out of insert mode
inoremap jj <ESC>
inoremap kk <ESC>

" For a smoother mouse scrolling
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

