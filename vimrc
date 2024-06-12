lua require('config')

" Check vim's Python version: :python import sys; print(sys.version)
" :echo has("python")
let s:uname = system("uname -s")
set clipboard+=unnamedplus
set nocompatible " Use vim settings
set modelines=0	" Prevent security hole

" For iTerm cross-SSH copy and paste on Linux
"let g:clipboard = {
"\   'name': 'myClipboard',
"\   'copy': {
"\      '+': ['ttyup'],
"\      '*': ['ttyup'],
"\   },
"\   'paste': {
"\      '+': '+',
"\      '*': '*',
"\   },
"\   'cache_enabled': 0,
"\ }

" All tabs are 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" General Settings
set visualbell                  " No bell
set t_vb=                       " No bell
set encoding=utf-8
set scrolloff=20                 " Allow text to scroll to center view when it's at the bottom of the document
set autoindent
set showmode
set showcmd                     " Show incomplete commands
set hidden                      " Open new file without being forced so save open buffer
set wildmenu
set wildmode=list:longest
" Ignore file types in autocomplete
set wildignore=*.pkl,*.swp,*.bak,*.pyc,*.class,*.o,*.obj,.DS_Store,*.jpg,*.d,*.dia,*.imageset,*.png,*.ai,*/Pods/*,*.xcworkspace,*.xcodeproj,*/tmp/*,*.lock,*/xcodebuild/*,*.orig,*.rope*,*/node_modules/*
set ruler                       " Show cursor position info in a line at the bottom
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set undofile                    " Preserve undo information between sessions
let mapleader = "\<Space>"             " Set <leader> to ,
autocmd FileType vim autocmd BufEnter * set textwidth=0     " Force this on .vimrc which otherwise attempts to override and text textwidth=78
set textwidth=0
set formatoptions-=tc
set autoread                    " Automatically read from file whenever it's changed on disk

" History
set backup
set writebackup
set swapfile
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//
set history=500		" keep 50 lines of command line history
set undolevels=500
set incsearch		" do incremental searching

" Auto save
:au FocusLost * silent! wa

" use ctrl-p to open fuzzy search
nnoremap <C-p> :<C-u>FZF<CR>
" use ctrl-f to open the file explorer
nnoremap <leader>f :NvimTreeToggle<CR>

" To find out what a key is mapped to execute :verbose map KEY, such as <C-h>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>el :e ~/.config/nvim/lua/config.lua<cr>
" Navigate splits the same way you navigate tmux panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Use 0 to jump to the first non-whitespace character on the line and ^ to go to the beginning of the line
nnoremap 0 ^
nnoremap ^ 0
" When accidentally typing :q out of order, do what's expected rather than showing a list of commands I may have been thinking of
map q: :q

nnoremap <c-d> <c-b>

" Search Settings
set ignorecase                      " Ignore case if all character in search string are lowercase
set smartcase                       " Case-sensitive search if at least one character is uppercase
set gdefault                        " By default, replace all occurrences of a word on the line
" Highlight search results while typing
set incsearch
" The below setting will highlight the matching parenthesis when it's closed, but the performance drag is too much.
"set showmatch
set hlsearch
" Remove search highlights with <leader><space>
nnoremap <leader><space> :noh<cr>
" Tab key matches bracket pairs
nnoremap <tab> %
vnoremap <tab> %
" Use semi-colon as colon key
nnoremap ; :

" Show/hide line numbers
nnoremap <leader>n :set number<cr>
nnoremap <leader>nn :set nonumber<cr>

" Don't use Ex mode, use Q for formatting
map Q gq

" Set the title of the Terminal to the currently open file
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        set title
    endif
endfunction
autocmd BufEnter * call SetTerminalTitle()

" Automatically edit any file that is open elsewhere, skip the message that asks for confirmation
augroup NoSimultaneousEdits
    autocmd!
    autocmd  SwapExists  *  :let v:swapchoice = 'e'
augroup END
set shortmess+=A " Don't warn about existing swap files
