" Encoding settings
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

colorscheme habamax

" Case insensitive search
set ignorecase

" Line numbers and relative numbering
set number
set relativenumber

" Indentation settings
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Smart indentation
set smartindent

" Disable line wrapping
set nowrap

" Disable swap files
set noswapfile
" Set undo directory and enable persistent undo (uncomment if needed)
"set undodir=~/.vim/undodir
"set undofile

" Search settings
set nohlsearch " Disable highlighting of search results
set incsearch   " Incremental search

" Enable true colors if supported
if has('termguicolors')
    set termguicolors
endif

" Scroll offset and sign column
set scrolloff=8
set signcolumn=yes

" Append '@-@" to the list of valid characters in file names
set isfname+=@-@

" Update time for plugins and swap file checking
set updatetime=50

" Color column and clipboard settings
set colorcolumn=80
set clipboard=unnamedplus
" Enable cursorline
set cursorline

" Set wildoptions to 'pum'
set wildoptions=pum

" Set background to 'dark'
set background=dark

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Highlight yanked text for 200ms using the "Visual" highlight group
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! exe 'highlight Yank' | redraw | sleep 200m | highlight clear Yank
augroup END
