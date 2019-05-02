set nocompatible              " be iMproved, required
filetype off                  " required

if has('win32') || has('win64')
    set fileformat=unix
    set rtp+=%HOME%/vimfiles/bundle/Vundle.vim/
    " set the runtime path to include Vundle and initialize
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')
    "set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    call vundle#begin('$USERPROFILE/vimfiles/bundle/')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" The following are examples of different formats supported:
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

" Git plugin not hosted on GitHub:
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin):
"Plugin 'file:///home/gmarik/path/to/plugin'

" plugin on GitHub repo:
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mhinz/vim-startify'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'wesQ3/vim-windowswap'
Plugin 'godlygeek/tabular'
Plugin 'rking/ag.vim'
Plugin 'universal-ctags/ctags'
"Plugin 'vim-scripts/cscope.vim'
"Plugin 'simplyzhao/cscope_maps.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"set guifont=*      " opens up font menu
if has ('gui_running')
    colorscheme jellybeans
    set background=dark

    if has('win32') || has('win64')
        set guifont=Consolas:h10:cANSI
    else
        set guifont=Ubuntu\ Mono\ 13
"    set guifont=Droid\ Sans\ Mono\ 11
    endif
endif

syntax on                       " syntax highlighting
set ruler                       " line and column in lower left corner
set number                      " show line number
set backspace=indent,eol,start  " backspace settings
set backspace=2                 " allow backspacing over indent, eol, and start of an insert
set expandtab
set tabstop=4                   " an indentation every 4 columns
set softtabstop=4               " let backspace delete indent
set shiftwidth=4                " use indent of 4 spaces
"set lines=90 columns=170
"set textwidth=80              " set the textwidth to be 80 chars
"syntax enable

set ignorecase                          " case insensitive search
set wildmenu                            " show list instead of just completing
set wildmode=list:longest,full          " change tab completion to be like Bash's
set wildignore=*.o,*.obj,*~,*.swp,*.pyc " files to ignore on auto complete
set showcmd                             " show commands
set incsearch                           " find as you type search
set hlsearch                            " highlight search terms
set sm                                  " automatic matching braces
set title                               " show title in terminal
" gui refers to gvim, cterm refers to terminal
highlight Search gui=bold term=bold cterm=bold guibg=black guifg=yellow ctermfg=white ctermbg=black
set visualbell                          "disable beeps and window flash
set noerrorbells
autocmd GUIEnter * set visualbell t_vb=
"highlight Search ctermbg=black ctermfg=yellow term=underline
"set ai                                 " auto indent 
"set noshowcmd                          " show commands

set listchars=tab:>.,trail:.,extends:\#,nbsp:. " Highlight problematic whitespace

" disable auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" split reverse open
set splitbelow
set splitright

"change the current working dir whenever open file, switch buffers, delete buffer or open/close a window:
set autochdir

set hidden                      " Make sure unsaved buffers can be put into background with error popup
set noswapfile
set nobackup
"set backupdir=C:\dev\vimSwap

" minibuf explorer
let g:miniBufExplVSplit = 20    " column width in chars
let g:miniBufExplBRSplit = 0    "Put new window above current or on the left for vertical split
let g:miniBufExplorerAutoStart = 0  "no auto-start
"let g:miniBufExplBRSplit = 1   "Put new window below current or on the right for vertical split

" ctrl-p
let g:ctrlp_max_files = 500000

" map '\' to enter ':Ag'
nnoremap \ :Ag<SPACE>

" https://robots.thoughtbot.com/faster-grepping-in-vim

" bind K to grep word under cursor
"nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"nnoremap K :exe 'Ag!' expand('<cword>')<cr>

"-----------------------------------------------------------------------------
" key mappings
"-----------------------------------------------------------------------------
"Commands                        Mode
"--------                        ----
"nmap, nnoremap, nunmap          Normal mode
"imap, inoremap, iunmap          Insert and Replace mode
"vmap, vnoremap, vunmap          Visual and Select mode
"xmap, xnoremap, xunmap          Visual mode
"smap, snoremap, sunmap          Select mode
"cmap, cnoremap, cunmap          Command-line mode
"omap, onoremap, ounmap          Operator pending mode

"nmap <c-r> :NERDTreeFind<CR>
"nmap <c-y> :CtrlPBuffer<CR>
"nmap <c-u> :CtrlPTag<CR>
"nmap <c-p> :TagbarToggle<CR>
nmap <c-i> :MBEToggle<CR>
nmap <c-o> :NERDTreeToggle<CR>
nmap <c-p> :CtrlP<CR>
"nmap <C-k7> :e buffer 
" hold down Ctrl and hjkl
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" window resizing
nmap <s-k> <c-w>10+
nmap <s-j> <c-w>10-
nmap <s-l> <c-w>10>
nmap <s-h> <c-w>10<
nmap <s-m> <c-w>_         " max current window horizontally
nmap <s-n> <c-w>|         " max current window vertically

nmap <c-s> :%s/
nmap <c-u> <c-r>          " remap redo. undo = u, redo = U
"nnoremap <c-\> <c-]>
"nnoremap <c-]> <c-t>

nmap <leader>s :%SaveSession
nmap <leader>o :%OpenSession

nnoremap <F1> :set hlsearch!<CR>
"-----------------------------------------------------------------------------
" ctags location
"-----------------------------------------------------------------------------
if has('win32') || has('win64')
    set tags=./tags,tags;$HOME
"    "For Windows, ctags file is in an expected location
"    set tags=C:\tools\vim_scripts\tags
else
    " look for tags file in the directory of current file,
    " then upward (the ';' character) until $HOME
    set tags+=./tags;$HOME
    "set tags+=~/tools/testing
    "set tags+=./tags,tags;
"   a ; after directory provides a stop point for vim to keep looking for tags
"    "For Linux, traverse up the directory to find the ctags file
"    set tags=tags;
end
