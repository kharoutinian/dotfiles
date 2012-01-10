" .vimrc

" #############################################################################
" # Basics
" #############################################################################
set nocompatible " no vi-compatible mode
set noexrc " don't use .(g)vimrc, .exrc in the local directory
set cpoptions=aABceFsmq
set t_Co=256
set virtualedit=all

" #############################################################################
" # Plugin management via Pathogen
" #############################################################################
filetype off
call pathogen#infect()
syntax on
filetype plugin indent on


" Set OS type
if has("win32") || has("win16")
    let osys="windows"
    behave mswin
else
    let osys=system('uname -s')
endif

set ttyfast
let g:tex_flavor='latex' " Fix tex files being opened as plaintext
let c_gnu=1
let c_comment_strings=1
let c_space_errors=1
set ofu=syntaxcomplete#Complete " Enable omnicomplete
set autochdir " always switch to the current file directory
set backspace=indent,eol,start " make backspace a more flexible
set backup " make backup files
set undofile  " Enables infinite undo even after buffer is closed.
if osys == "windows"
    set backupdir=$HOME/vim/backup " where to put backup files
    set directory=$HOME/vim/tmp " directory to place swap files in
    set undodir=$HOME/vim/undo " Directory to save undo files in
else
    set backupdir=~/.vim/backup " where to put backup files
    set directory=~/.vim/tmp " directory to place swap files in
    set undodir=~/.vim/undo " Directory to save undo files in
endif
set clipboard+=unnamed " share windows clipboard
set fileformats=unix,dos,mac " support all three, in this order
set hidden " you can change buffers without saving
" (XXX: #VIM/tpope warns the line below could break things)
"set iskeyword+=_,$,@,%# " none of these are word dividers
set noerrorbells " don't make noise
set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
set pastetoggle=<F9>  " Enter 'paste mode' so indenting isn't messed up
set wildmenu " turn on command line completion wild style
" ignore these list file extensions
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set wildignore+=*.aux,*.pdf
set wildmode=list:longest " turn on wild mode huge list


if has("autocmd")

    " Make syntax highlighting for jQuery better
    au BufRead,BufNewFile *.js set ft=javascript syntax=jquery
    " au BufRead,BufNewFile *.pde set ft=arduino
    au BufRead,BufNewFile *.pde set ft=c
    au FocusLost * :wa  " Save when Vim loses focus

    augroup prog
        au!
        "au BufRead *.c,*.cc,*.cpp,*.h,*.java set formatoptions=croql
        "au BufEnter *.java      noremap <C-Return> :w\|:!javac %<CR>
        "au BufEnter *.c         noremap <C-Return> :w\|:!gcc %<CR>
        "au BufEnter *.cc,*.cpp  noremap <C-Return> :w\|:!g++ %<CR>
        au BufEnter *.py        noremap <C-Return> :w\|:!python %<CR>
        au BufLeave *.py        unmap <C-Return>

        " Don't expand tabs to spaces in Makefiles
        au BufEnter  [Mm]akefile*  set noet
        au BufLeave  [Mm]akefile*  set et

        " Set up folding for python
        au FileType python set nofoldenable foldmethod=indent
    augroup END

endif

" set cursorcolumn " highlight the current column
set cursorline " highlight current line
set incsearch " highlight as you type you search phrase
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set list " show whitespace
set listchars=tab:>-,trail:- " show tabs and trailing
set matchtime=2 " how many tenths of a second to blink matching brackets for
set hlsearch " highlight searched for phrases
set nostartofline " leave my cursor where it was
set novisualbell " don't blink
set relativenumber " turn on line numbers
set report=0 " tell us when anything is changed via :...
set ruler " Always show current positions along the bottom
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
set showcmd " show the command being typed
set showmatch " show matching brackets
set sidescrolloff=10 " Keep 10 lines at the size
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]


"" Text Formatting/Layout {
set autoindent
set colorcolumn=80  " Display colored column at 80 characters over.
set expandtab " no real tabs please!
set formatoptions=croqn
set gdefault  " always replace globally
set ignorecase " case insensitive by default
set infercase " case inferred by default
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set smartcase " if there are caps, go case-sensitive
set smartindent
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
set showmatch
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set tabstop=4 " real tabs should be 4, and they will show with
set textwidth=79  " Number of characters allowed on one line
"set wrap


" Folding
set foldenable " Turn on folding
set foldmarker={,} " Fold C style code (only use this as default
" if you use a high foldlevel)
set foldmethod=indent " Fold on the indent
highlight Folded ctermfg=blue
highlight FoldColumn ctermfg=white
set fillchars=fold:-
set foldlevel=100 " Start with this many levels open
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds


" Plugin Settings {
let b:match_ignorecase = 1 " case is stupid
let perl_extended_vars=1 " highlight advanced perl vars
" inside strings
" Use Ack
"let g:ackprg="ack -H --nocolor --nogroup --column"

" Use latexsuite
set grepprg=grep\ -nH\ $*

" TagList Settings {
let Tlist_Auto_Open=0 " let the tag list open automagically
let Tlist_Compact_Format = 1 " show small menu
let Tlist_Ctags_Cmd = 'ctags' " location of ctags
let Tlist_Enable_Fold_Column = 0 " do show folding tree
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
let Tlist_Sort_Type = "name" " order by
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_WinWidth = 40 " 40 cols wide, so i can (almost always)
" read my functions
" Language Specifics {
" just functions and classes please
let tlist_aspjscript_settings = 'asp;f:function;c:class'
" just functions and subs please
let tlist_aspvbs_settings = 'asp;f:function;s:sub'
" don't show variables in freaking php
let tlist_php_settings = 'php;c:class;d:constant;f:function'
" just functions and classes please
let tlist_vb_settings = 'asp;f:function;c:class'
" }

" a.vim Settings
let g:alternateExtensions_cu = "h,cuh"
map ,a :A<RETURN>




" Mappings {
" ROT13 - fun
" map <F12> ggVGg?
" Change leader to ,
let mapleader = ","
" Remove search highlighting
nnoremap <leader><space> :noh<cr>
" Use tab to move between braces
nnoremap <tab> %
vnoremap <tab> %
" Working with split windows.
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Use Ack easily
"noremap <leader>g :Ack
" Removes tabs in a file and replaces with two spaces.
map <F2> <ESC>:%s/\t/    /<RETURN>
" Removes trailing whitespace from a file
map <F3> <ESC>:%s/\s\+$//<RETURN><cr>:let @/=''<CR>
" Select the recently pasted text
nnoremap <leader>v V`]
" Map cursor movements
nnoremap ; $
" Make cursor move more naturally with wrapped text.
nnoremap j gj
nnoremap k gk
" Map :cn and :cp to cn, cp for quick compiler error fixing
map cn <esc>:cn<RETURN>
map cp <esc>:cp<RETURN>
" Map jj to escape from insert mode
inoremap jj <ESC>
" space / shift-space scroll in normal mode
noremap <S-space> <C-b>
noremap <space> <C-f>
" Open NERDtree at home directory
map <F12> <ESC>:NERDTreeToggle $HOME<RETURN>
" Open .vimrc in a new tab.
nnoremap <leader>ev :tabedit $MYVIMRC<RETURN>

" Make Arrow Keys Useful Again {
map <down> <ESC>:bn<RETURN>
map <left> <ESC>:NERDTreeToggle<RETURN>
map <right> <ESC>:Tlist<RETURN>
map <up> <ESC>:bp<RETURN>
" }
" }

" GUI Settings {
if has("gui_running")
    " Basics {
    set columns=85 " View one file.
    set background=dark
    "colorscheme solarized
    colorscheme vividchalk
    set mousehide " hide the mouse cursor when typing
    set vb t_vb=".
    if &diff
        let &columns = 175
        " double the width up to a reasonable maximum
        "let &columns = ((&columns*2 > 190)? 190: &columns*2)
    endif
    " }

    set guioptions-=L  " Get rid of the left scroll bar
    set guioptions-=r  " Get rid of the right scroll bar
    set guioptions-=T  " Get rid of the GUI buttons
    set relativenumber  " Show the number of lines away from the current line
    " instead of the absolute line number
    " Spell check comments
    set spell spelllang=en_us
    " OS Specific gui settings {
    if osys == "windows"
        set guifont=Consolas
    else
        set guifont=Inconsolata\ Medium\ 11
        " Change console window title bar to the name of the buffer being edited.
        auto BufEnter * let &titlestring="VIM - ".expand("%:p")
    endif
    " }
else
    colorscheme vividchalk
endif
" }

" #############################################################################
" # CppOmiComplete settings
" #############################################################################
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/qt4

" build tags of your own project with Ctrl-F12
map <S-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview



