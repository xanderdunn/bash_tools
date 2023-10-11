" Plugins {{{
call plug#begin()
Plug 'scrooloose/nerdcommenter'             " Commenting shortcuts
Plug 'scrooloose/nerdtree'                  " File system explorer
"Plug 'rking/ag.vim'                         " ag support for searching files
"Plug 'Numkil/ag.nvim'                       " ag support for searching file, asynchronous neovim support
Plug 'mileszs/ack.vim'                      " File string search
Plug 'honza/vim-snippets'                   " default snippets for ultisnips
Plug 'altercation/vim-colors-solarized'     " Color scheme
"Plug 'AndrewRadev/simple_bookmarks.vim'     " Persistent, global marks
"Plug 'MattesGroeger/vim-bookmarks'          " persistent project bookmarks.  It adds a gutter that is annoying.
"Plug 'jupyter-vim/jupyter-vim'              " Two-way Jupyter<>vim notebooks
"Plug 'benekastah/neomake'                   " Asynchronous errors, warnings, and style checking using neovim async client/server plugin feature
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense in-line hinting and errors
"Plug 'vim-syntastic/syntastic'              " Synchronous linting for R and Swift
Plug 'airblade/vim-rooter'                  " Change neovim's working directory to the project's root directory based on git root
Plug 'chrisbra/csv.vim'
"Plug 'vim-scripts/vim-auto-save'
Plug 'jamessan/vim-gnupg'                   " Seamlessly work with GPG encrypted files
Plug 'tpope/vim-eunuch'                     " Adds commands like :Move
"Plug 'rust-lang/rust.vim' " Doesn't appear to be useful when using coc-rust-analyzer
Plug 'github/copilot.vim'
"Plug 'kenn7/vim-arsync'                     " Async rsync on file save

nnoremap dm :execute 'delmarks '.nr2char(getchar())<cr>

" R
"Plug 'jalvesaq/Nvim-R'

" Rust {{{
syntax enable
let g:rust_fold = 2
let g:rustfmt_autosave = 1
" }}}

" JavaScript {{{
"Plug 'pangloss/vim-javascript' " Improved JavaScript indentation and folding
" }}}

" Unused {{{
"Plug 'xolox/vim-notes'                      " Easy note taking
"Plug 'bling/vim-airline'                    " Show useful information in the status bar
" Plug 'jaxbot/semantic-highlight.vim'       " Highlight each variable a different color
"Plug 'YankRing.vim'                          " Yank history
" vim-repeat = a . function that repeats an entire macro rather than the last command only
" Documentation search: https://github.com/Keithbsmiley/investigate.vim
"Plug 'thomasgubler/vim-gitignore'           " Respect .gitignore in vim's wildignore
"Plug 'tpope/vim-dispatch'                   " Asynchronous build
" }}}

" LISP {{{
"Plug 'kovisoft/slimv'                       " LISP, this interprets .jl files as LISP files and causes problems for Julia
" }}}

" Elixir {{{
"Plug 'elixir-lang/vim-elixir'
"Plug 'slashmili/alchemist.vim'
" }}}

" Elm {{{
"Plug 'lambdatoast/elm.vim'
" }}}

" Python {{{
"Plug 'jmcantrell/vim-virtualenv'            " virtualenv control
"Plug 'lambdalisue/vim-pyenv'                 " pyenv control
"Plug 'Vigemus/iron.nvim'
"Plug 'jpalardy/vim-slime'    " vim repl
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' } " code formatting
Plug 'tmhedberg/SimpylFold'
" }}}

" General Code Formatting {{{
Plug 'kien/rainbow_parentheses.vim'         " parentheses pretty highlighting
Plug 'nathanaelkane/vim-indent-guides'      " Pretty lines to follow the begnning and end of code blocks
Plug 'tpope/vim-endwise'                    " Wisely add endings like endif, endfunction, etc..
Plug 'tpope/vim-surround'                   " Add, remove, and change surrounding characters in pairs
Plug 'Raimondi/delimitMate'                 " Automatically insert closing brackets
Plug 'Konfekt/FastFold'                     " Improve fold performance
" }}}

" Docker {{{
Plug 'ekalinin/Dockerfile.vim'
" }}}

" Scala {{{
"Plug 'derekwyatt/vim-scala'
"Plug 'tfnico/vim-gradle'    " Recognize gradle syntax
"Plug 'ensime/ensime-vim'    " Code completion server
" }}}

" Julia {{{
"Plug 'JuliaLang/julia-vim'
"Plug 'zyedidia/julialint.vim'
" }}}

" Haskell {{{
"Plug 'neovimhaskell/haskell-vim'        " syntax highlightingn
"Plug 'enomsg/vim-haskellConcealPlus'    " Show common Haskell symbols as unicode characters
"Plug 'dag/vim2hs'                      "syntax highlighting and converting functions to pointfree, syntax highlighting was too slow for me
"Plug 'bitc/vim-hdevtools'               "Lightning fast type-checking
"Plug 'eagletmt/ghcmod-vim'
"Plug 'eagletmt/neco-ghc'
"Plug 'Twinside/vim-hoogle'
"Plug 'mpickering/hlint-refactor-vim'
" https://github.com/begriffs/haskell-vim-now/blob/master/.vimrc
" }}}

" nim {{{
"Plug 'baabelfish/nvim-nim'
" }}}

" git {{{
Plug 'tpope/vim-unimpaired'                 " Keyboard shortcut to jump to next git conflict
Plug 'tpope/vim-fugitive'                   " git wrapper
Plug 'airblade/vim-gitgutter'               " Show which lines have changed in the gutter
" }}}

" Solidity {{{
Plug 'tomlion/vim-solidity'
" }}}

" tmux {{{
Plug 'christoomey/vim-tmux-navigator'     " Navigate tmux panes and windows like vim splits
"Plug 'benmills/vimux'                     " vim + tmux convenience commands
Plug 'xolox/vim-session'                  " Save and restore vim state
"Plug 'tmux-plugins/vim-tmux'              " Proper syntax highlighting and editing of tmux.conf
" }}}

" Go {{{
"Plug 'fatih/vim-go', {'for': 'go'}          " Autocompletion, syntax highlighting, etc.
" }}}

" Markdown {{{
Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'            " Highlighting, folding, etc.
"Plug 'shime/vim-livedown'                 " Live updating Markdown preview
" }}}

" Xcode functionality {{{
Plug 'ctrlpvim/ctrlp.vim'                   " quick search bar
Plug 'FelikZ/ctrlp-py-matcher'              " faster ctrlp index searcher
"Plug 'b4winckler/vim-objc'                  " Better Obj-C indenting
"Plug 'SirVer/ultisnips'                     " code snippets
"Plug 'eraserhd/vim-ios'                     " .h <-> .m switching and project build
"Plug 'Valloric/YouCompleteMe'               " code completion
Plug 'Valloric/ListToggle'                  " Toggle the display of the location and quickfix windows
Plug 'Chiel92/vim-autoformat'               " Auto-format code using existing formatters
Plug 'qstrahl/vim-matchmaker'               " Highlight the term under the cursor
Plug 'xolox/vim-misc'                       " Dependency for vim-easy-tags
Plug 'xolox/vim-easytags'                   " Automatically update exuberant ctags for syntax highlighting of user-defined variables
"Plug 'toyamarinyon/vim-swift'               " Swift syntax and indenting
"Plug 'keith/swift.vim'
" }}}
call plug#end()
" }}}

" UI {{{
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
" Make the gutter background the same color as the text area's background
let g:gitgutter_override_sign_column_highlight = 0
set signcolumn=yes
highlight SignColumn ctermbg=None
" }}}

" Settings {{{
" Check vim's Python version: :python import sys; print(sys.version)
" :echo has("python")
let s:uname = system("uname -s")
"if s:uname == "Darwin"
    "let g:python_host_prog = '/usr/local/anaconda3/envs/python2/bin/python'
    "let g:python3_host_prog = '/usr/local/anaconda3/bin/python3'
"endif
if has('macunix')
    let g:python3_host_prog = '/opt/homebrew/bin/python3.11'
endif
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
set scrolloff=3                 " Allow text to scroll to center view when it's at the bottom of the document
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
" TODO: Map something with the option meta key:
" :nnoremap <silent>∆ :set paste<CR>m`o<Esc>`:set nopaste<CR>`

" in many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=c
endif

" Spell Check
"autocmd BufRead,BufNewFile *.md setlocal spell
"autocmd BufRead,BufNewFile *.txt.gpg setlocal spell

" History
"set nobackup		" prevent the ~ backup files from appearing on the filesystem
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
"autocmd BufUnload,BufLeave,FocusLost,QuitPre,InsertLeave,TextChanged,CursorHold * silent! w
" This causes files to be erased on open sometimes
:au FocusLost * silent! wa
" }}}

" Keyboard Mappings {{{
" To find out what a key is mapped to execute :verbose map KEY, such as <C-h>
nnoremap <leader>ev :e $MYVIMRC<cr>
" Reload .vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Open a new vertical split window and switch to it
nnoremap <leader>w <C-w>v<C-w>l
" Navigate splits the same way you navigate tmux panes
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
set pastetoggle=<F2>    " Toggle paste mode to disable syntax changes to content that's pasted iv
" Go backward in jumplist
nnoremap <C-a> <C-i>
" Use 0 to jump to the first non-whitespace character on the line and ^ to go to the beginning of the line
nnoremap 0 ^
nnoremap ^ 0
" When accidently typing :q out of order, do what's expected rather than showing a list of commands I may have been thinking of
map q: :q

" Save a file that requires sudo privelage after you opened it
cmap w!! w !sudo tee % >/dev/null

nnoremap <c-d> <c-b>

" Search Settings
"nnoremap / /\v
"vnoremap / /\v
set ignorecase                      " Ignore case if all character in search string are lowercase
set smartcase                       " Case-sensitive search if at least one character is uppercase
set gdefault                        " By default, replace all occurences of a word on the line
" Highlight search results while typing
set incsearch
" The bellow setting will highlight the matching parenthesis when it's closed, but the performance drag is too much.
"set showmatch
set hlsearch
" Remove search highlights with <leader><space>
nnoremap <leader><space> :noh<cr>
" Tab key matches bracket pairs
nnoremap <tab> %
vnoremap <tab> %
" Use semi-colon as colon key
nnoremap ; :
"nnoremap <leader>:

"These are to cancel the default behavior of d, D, c, C to put the text they delete in the default register. Note that this means e.g. "ad won't copy the text into register a anymore.  You have to explicitly yank it.
"vnoremap i d \| :let @"=@c<cr>
"nnoremap d "cd
"vnoremap d "cd
"nnoremap D "cD
"vnoremap D "cD
"nnoremap c "cc
"vnoremap c "cc
"nnoremap C "cC
"vnoremap C "cC
"nnoremap x "cx
"vnoremap x "cx

" Replace the selected text with what's in the yank register
"vmap r "_dP

" vim training
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Show/hide line numbers
nnoremap <leader>n :set number<cr>
nnoremap <leader>nn :set nonumber<cr>
nnoremap <leader>m :set relativenumber<cr>
nnoremap <leader>mm :set norelativenumber<cr>
" Cool ideas to show relative or absolute line numbers depending on current use
":au FocusLost * :set number
":au FocusGained * :set relativenumber
"autocmd InsertEnter * :set number


" Don't use Ex mode, use Q for formatting
map Q gq

" Cut (Copy and then delete the current line)
"nnoremap yd yydd<CR>
"vnoremap yd y \| d<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Jump to next and previous items in quickfix list
" Having either of these shortcuts enabled breaks selecting items in the quickfix list by
" pressing Enter
"nnoremap <leader>j :cn<cr>
"nnoremap <leader>k :cp<cr>

" tmux navigator
noremap <silent> <c-/> :TmuxNavigatePrevious<cr>
"tnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
"tnoremap <silent> <c-j> :TmuxNavigateDown<cr>
"tnoremap <silent> <c-k> :TmuxNavigateUp<cr>
"tnoremap <silent> <c-l> :TmuxNavigateRight<cr>
inoremap <silent> <c-h> <Esc>:TmuxNavigateLeft<cr>I
inoremap <silent> <c-k> <Esc>:TmuxNavigateUp<cr>I
inoremap <silent> <c-l> <Esc>:TmuxNavigateRight<cr>I

nnoremap <leader>no :e Note.md<cr>

" Exit terminal mode:
tnoremap <Esc> <C-\><C-n>

noremap <silent> <leader>fp :let @+=expand("%:p")<CR>

" Haskell Lint
nmap <silent> <leader>hl :Neomake hlint<CR>

" GHC errors and warnings
nmap <silent> <leader>hc :Neomake ghcmod<CR>

" Options for Haskell Syntax Check
let g:neomake_haskell_ghc_mod_args = '-g-Wall'

" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>

" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>

" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo

" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>

au FileType haskell nnoremap <buffer> <leader>t :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

" coc.nvim tab completion:
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
try
    nmap <silent> <leader>j :call CocAction('diagnosticNext')<cr>
    nmap <silent> <leader>k :call CocAction('diagnosticPrevious')<cr>
endtry

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" }}}

" Frequent Files {{{
" File to keep all of my debugging tips, reminders, and checlist for myself
:command! Todo :e ~/Dropbox/dev/docs/nvim-todo.md
:command! Bug :e ~/Dropbox/dev/docs/bug-todo.md
:command! Apple :e ~/Dropbox/dev/docs/apple.md
:command! Memories :e ~/Dropbox/life/memories
:command! Math :e ~/Dropbox/dev/math.md
:command! Cs :e ~/Dropbox/dev/cs.md
:command! ML :e ~/Dropbox/dev/docs/ml/ml.md
:command! RL :e ~/Dropbox/dev/docs/rl/reinforcement.md
:command! Nlp :e ~/Dropbox/dev/docs/nlp.md
:command! Stats :e ~/Dropbox/dev/docs/stats.md
" }}}

" Plugin Settings {{{

"julia-vim {{{
let g:latex_to_unicode_auto = 1
" }}}

"haskell-vim {{{
let g:haskell_indent_disable = 1
"}}}

"vim-surround {{{
" NOTE: we explicitly set a temporary marker (z) and restore
"       it after the surround operation because otherwise the
"       surround plugin will move the cursor to the opening
"       quote of the operand after the operation, instead of
"       keeping the cursor where it was before the operation
"
nmap <Leader>' mzcs"'`z
nmap <Leader>" mzcs'"`z
" Surround the current line with [] and return to the original cursor position
nmap <Leader>r mzyssr`z
" }}}

"delimitMate {{{
" Skip over closing parenthesis when pressing tab when it's the next character
function! SkipClosingParentheses()
  let line = getline('.')
  let current_char = line[col('.')-1]

  "Ignore EOL
  if col('.') == col('$')
    return "\t"
  end

  return stridx(']})', current_char)==-1 ? "\t" : "\<Right>"
endfunction

"inoremap <expr> <Tab> SkipClosingParentheses()
" }}}

" nerd-tree {{{
map <leader>f :NERDTreeToggle<CR>
let NERDTreeIgnore=['__init__.py', '\.egg-info', 'build[[dir]]', '\.jar', 'scapegoat\.', '__pycache__', '\.tf', '\.tf.meta', '\.png', '\.pyc', '\.lprof', '\.csv', 'checkpint', '\.txt', 'node_modules[[dir]]']
" }}}

" simple-bookmark.vim {{{
let g:simple_bookmarks_filename = getcwd() + '.vim-bookmarks'
:command! -nargs=+ B :Bookmark <args>
:command! -nargs=+ BG :GotoBookmark <args>
:command! -nargs=+ BD :DelBookmark <args>
:command! BA :CopenBookmark
" }}}

" vim-bookmarks {{{
"let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
" }}}

" iron.nvim {{{
"luafile $HOME/dev/bash_tools/plugins.lua
" }}}

" vim.slime {{{
let g:slime_target = "neovim"
" To use a python repl in neovim:
" <Space> w to open a new split
" Use <ctrl> j and <ctrl> h to move between the splits
" i to enter insert mode on the terminal
" Start the python3 process in the terminal
" <Esc> to exet terminal mode
" :echo b:terminal_job_id to get the terminal's process id, usually it's 6
" Highlight some code in your code editor split and :ReplSend
" When it asks, give it the terminal_job_id you found above
" }}}

" FastFold {{{
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
function! SetFoldMethod()
   if &ft =~ 'vim'
        set foldmethod=marker   " I want to be able to manually sort into folded sections
        "set foldlevel=0
    elseif &ft =~ 'scala'
        setlocal foldmethod=indent
        "setlocal foldlevel=0
    elseif &ft =~ 'py'
        setlocal foldmethod=indent
        "setlocal foldlevel=0
    elseif &ft =~ 'julia'
        setlocal foldmethod=indent
        "setlocal foldlevel=1
    elseif &ft =~ 'sh'
        setlocal foldmethod=marker
        "setlocal foldlevel=0
    elseif &ft =~ 'cpp'
        setlocal foldmethod=indent
    elseif &ft =~ 'rust'
        setlocal foldmethod=indent
        setlocal foldlevel=1
    else
        set foldcolumn=0        " Something is trying to set foldcolumn=3 for .m objc files.  Override it.
        set foldmethod=syntax
    endif
endfun
autocmd BufRead * call SetFoldMethod()
set foldlevel=2
"autocmd Filetype cpp AnyFoldActivate
set foldnestmax=5
set foldcolumn=0
"let g:fastfold_savehook = 0     " Don't update folds on file save
"let g:fastfold_togglehook = 1   " Update folds when the user toggles a fold
" Go to the end of the current fold
nmap z] zo]z
" Go to the beginning of the current fold
nmap z[ zo[z
" }}}

" ctrlp {{{
" Search through ctags
nnoremap <leader>. :CtrlPTag<cr>
" Make ctrlp indexing a lot faster
"let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden --depth 9
      "\ -g ""'
" The above command has a race condition that sometimes comes up empty
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0             " ag is so fast that caching isn't necessary
"let g:ctrlp_max_files = 1000           " These two settings take no effect when using a third party indexer
"let ctrlp_max_depth = 20
let g:ctrlp_working_path_mode = 'r'     " Always use the current working directory rather than the location of the current file
let g:ctrlp_by_filename = 1             " Default to filename only search rather than searching the whole path
" }}}

" vim-easytags {{{
let g:easytags_async = 1
let g:easytags_file = '~/.config/nvim/tags'
let g:eastytags_always_enable = 1 " Highlight tags immediately on entering a file
let g:easytags_python_enabled = 1 " The Python highlighter is 2x faster than the VimScript highlighter
" easy-tags should automatically execute :UpdateTags on CursorHold
"autocmd FileType objc,cpp,c,python autocmd InsertLeave <buffer> :silent UpdateTags
" }}}

" unite.vim {{{
noremap <C-p> :Unite file_rec/async<cr>
" }}}

" neomake {{{
let g:neomake_scala_scalac_maker = {
            \ 'args': ['-Ystop-after:parser', "-deprecation", "-encoding", "UTF-8", "-feature", "-language:existentials", "-language:higherKinds", "-language:implicitConversions", "-unchecked", "-Xfatal-warnings", "-Xlint", "-Yno-adapted-args", "-Ywarn-dead-code", "-Ywarn-numeric-widen", "-Ywarn-value-discard", "-Xfuture", "-Ywarn-unused-import"],
        \ 'errorformat':
            \ '%E%f:%l: %trror: %m,' .
            \ '%Z%p^,' .
            \ '%-G%.%#'
    \ }
let g:neomake_scala_scalastyle_maker = {
    \ 'args': ['-c', '~/Dropbox/config/scalastyle_config.xml'],
    \ 'errorformat':
        \ '%trror file=%f message=%m line=%l column=%c,' .
        \ '%trror file=%f message=%m line=%l,' .
        \ '%tarning file=%f message=%m line=%l column=%c,' .
        \ '%tarning file=%f message=%m line=%l'
    \ }
let g:neomake_python_enabled_makers = ['python', 'pylint', 'flake8']  " flake8 includes pep8, pyflakes, and mccabe; pylama includes pylint, pep8, mccabe, and pyflakes; pychecker isn't developed anymore
let g:neomake_haskell_enabled_makers = ['hlint', 'ghcmod', 'hdevtools']
" }}}

" syntastic {{{
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['swift'], 'passive_filetypes': ['python'] }
let g:syntastic_swift_checkers = ['swiftlint']
" }}}

" vim-autoformat {{{
"set updatetime=4000
" TextChanged,InsertLeave
autocmd FileType python,cpp,scala,objc,swift,julia,haskell autocmd BufWritePost <buffer> call FormatAndCheck()

function! FormatAndCheck()
        :silent! :Neomake
endfunction
" }}}

" coc.nvim {{{
set updatetime=300
nnoremap <leader>e  :<C-u>CocList diagnostics<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}

" vim-session {{{
let g:session_directory = getcwd()          " The session directory is always the current directory.  This should allow save and restory on a per project basis
let g:session_default_name = ".vim-session"
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_lock_enabled = 0
autocmd QuitPre * silent! SaveSession
" }}}

" fugitive {{{
set statusline+=%{fugitive#statusline()}
:command! Ghistory :Glog -- %
" }}}

" YouCompleteMe {{{
"nnoremap <leader>d :YcmCompleter GoToDefinition <cr>
"nnoremap <leader>s :YcmCompleter GoToDeclaration <cr>
"let g:ycm_server_log_level = 'debug'
"if s:uname == "Darwin"
    "let g:ycm_path_to_python_interpreter = '/usr/local/anaconda3/envs/python2/bin/python'
"endif
"let g:ycm_use_ultisnips_completer = 1
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
":command! Errors :YcmDiag
"let g:ycm_confirm_extra_conf = 0
"set completeopt-=preview " Don't show the window at the top with additional completion information
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_collect_identifiers_from_tags_files = 1   " Load completion identifiers from the ctags files as well.  ctags files in use can be found with `:echo tagfiles()`
"let g:ycm_autoclose_preview_window_after_completion = 1 " Close the window at the top that appears with additional completion information
"let g:ycm_autoclose_preview_window_after_insertion = 1
"function! SetErrorsAndWarnings() " Only show the errors and warnings gutter if it's a file that I wrote
    "let currentFilePath = expand('%:p')
    "echo currentFilePath
    "if currentFilePath =~ '/Dropbox/dev/'
        "let g:ycm_show_diagnostics_ui = 1
    "elseif currentFilePath =~ '/local'
        "let g:ycm_show_diagnostics_ui = 1
    "else
        "let g:ycm_show_diagnostics_ui = 0
    "endif
"endfunction
" Execute the function before the file is opened so that it can be turned off in time for files that are be opened
"autocmd BufRead * call SetErrorsAndWarnings()
" Execute it on entering a buffer so that it can be turned on for files that were already read
"autocmd BufEnter * call SetErrorsAndWarnings()
"let g:ycm_semantic_triggers =  {
  "\   'objc' : ['re!\@"\.*"\s',
  "\     're!\@\w+\.*\w*\s',
  "\     're!\@\(\w+\.*\w*\)\s',
  "\     're!\@\(\s*',
  "\     're!\@\[.*\]\s',
  "\     're!\@\[\s*',
  "\     're!\@\{.*\}\s',
  "\     're!\@\{\s*',
  "\     "re!\@\'.*\'\s",
  "\     '#ifdef ',
  "\     're!:\s*',
  "\     're!=\s*',
  "\     're!,\s*', ],
  "\ }
" }}}

" ListToggle {{{
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
" }}}

" vim-auto-save {{{
let g:auto_save = 1                 " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 1          " do not display the auto-save notification
let g:auto_save_no_updatetime = 1   " do not set the updatetime to 200
" }}}

" rainbow {{{
let g:rainbow_active = 1
" }}}

" rainbow_parentheses {{{
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
    "\ ['gray',        'RoyalBlue3'],
    "\ ['black',       'SeaGreen3'],
    "\ ['darkgray',    'DarkOrchid3'],
" }}}

" ag.nvim ack.vim {{{
let g:ackprg = 'ag --vimgrep --smart-case'
:command! -nargs=+ S :Ack '<args>'
:command! -nargs=+ SR :Ack --rust '<args>'
:command! -nargs=+ SP :Ack --python '<args>'
" }}}

" UltiSnips {{{
"The below key bindings are compatible with YouCompletMe integration
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-x>"
let g:UltiSnipsUsePythonVersion = 2
" }}}

" vim-matchmaker {{{
" Underline words matched by Matchmaker
function! ToggleMatchmaker()
    " Don't show matches in non-code files
    if &ft =~ 'objc\|objcpp\|python\|cpp\|scala\|swift\|vim\|julia'
        Matchmaker
    else
        " Specifically, I want it disabled on help, mkd
        Matchmaker!
    endif
endfun
"autocmd BufEnter * call ToggleMatchmaker()
highlight Matchmaker guibg=NONE
highlight Matchmaker gui=underline
highlight Matchmaker ctermbg=NONE
highlight Matchmaker cterm=underline
" }}}

" YankRing {{{
" Show all yanks with YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>
" }}}

" vim-livedown {{{
let g:livedown_autorun = 1
let g:livedown_open = 1
let g:livedown_port = 1337
" }}}

" vim-instant-markdown {{{
filetype plugin indent on
let g:instant_markdown_autostart = 0
let g:vim_markdown_math=1
" }}}
" }}}

" Autocommands {{{
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
" :help autocmd-events
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

"cnoreabbrev up ARsyncUp

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

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

" Remove all trailing whitespaces on file save (doesn't remove trailing newlines)
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Whenever vim gains focus, autoload any changes made by another process,
" don't try to run this in the command line.  It will cause an error
"autocmd CursorHold * if getcmdwintype() == '' | checktime | endif
" }}}

" Builds {{{
function! Build()
    :silent! call StripTrailingWhitespaces()
    :silent! :wall
    :silent! Make
    if &ft =~ 'python\|cpp'
        :silent! :Autoformat
        :silent! :wall
    endif
endfunction
nnoremap <silent> <leader>b :call Build()<cr>

" The same as :set, but it automatically escapes the arguments
function! Set( ... )
  let result = ''
  for i in a:000
    if ( i !~ '[=!?]' )
      let result .= '\'
    endif
    " Escaping out any existing spaces takes care of the case where we passed in escaped spaces.
    let result .= ' ' .escape( i, ' ' )
  endfor
  execute 'set' .result
endfunction
com! -nargs=+ -complete=option Set call Set( <f-args> )
" }}}

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" GPG keys should not be saved elsewhere
autocmd BufReadPre,FileReadPre *.gpg set noswapfile
autocmd BufReadPre,FileReadPre *.gpg set nobackup
autocmd BufReadPre,FileReadPre *.gpg set noundofile
let g:GPGPreferArmor=1
let g:GPGDefaultRecipients=["mykey1@mykey1.com"]

"function! SetAutoSave()
   "if &ft =~ 'gpg'
        ":AutoSaveToggle
    "else
        ":AutoSaveToggle
    "endif
"endfun
"autocmd BufReadPre * call SetAutoSave()

:set listchars=eol:$

map <C-Y> :call yapf#YAPF()<cr>
imap <C-Y> <c-o>:call yapf#YAPF()<cr>

" Remember:
" gd to go to definition
" K to show definition
" zz to center cursor on screen
" :Git blame shows the blame in the history
" Select some Python code and press Ctrl-C to run yapf on it
" YAPF usage: https://github.com/google/yapf/tree/main/plugins
" TODO: What's the command for running yapf on a selection of code?
" TODO: Stop the folds from collapsing when running YAPF
" TODO: Learn how to edit all instances of a variable. This might help:
" https://github.com/neoclide/coc.nvim/wiki/Multiple-cursors-support
" To get in-line errors in Rust: sudo apt install protobuf-compiler, rustup component add rls rust-analysis rust-src, in nvim :CocInstall coc-rls
" https://github.com/fannheyward/coc-pyright
"     :CocInstall coc-pyright
" To diagnose rust-analyzer problems:
"     Set "rust-analyzer.trace.server": "messages" in :CocConfig and try :CocCommand workspace.showOutput rust-analyzer.
" To configure Coc to format file on save:
"        "coc.preferences.formatOnSaveFiletypes": ["rust"]
" :CocConfig working on my Trainium machine:
" {
"     "rust-analyzer.cargo.extraEnv": { "CPATH": "/opt/aws/neuron/include", "LIBRARY_PATH": "/opt/aws/neuron/lib", "LD_LIBRARY_PATH": "/opt/aws/neuron/lib" },
"     "rust-analyzer.trace.server": "messages",
"     "coc.preferences.formatOnSaveFiletypes": ["rust", "python"],
"     "rust-analyzer.cargo.buildScripts.overrideCommand": ["/home/ubuntu/.cargo/bin/cargo", "check", "--message-format=json", "--all-targets" , "--package", "xla", "--no-default-features", "--features", "trn"],
"     "rust-analyzer.check.overrideCommand": ["/home/ubuntu/.cargo/bin/cargo", "check", "--message-format=json", "--all-targets" , "--package", "xla", "--no-default-features", "--features", "trn"]
" }
