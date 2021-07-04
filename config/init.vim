set nocompatible              " be iMproved, required
filetype off                  " required

if has('win32') || has('win64')
    set fileformat=unix
    call plug#begin('$USERPROFILE/vimfiles/plugged/')
else
    " automatic install of vim-plug if not present
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
    endif

    call plug#begin('~/.config/nvim/plugged')
endif

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plug 'ascenator/L9', {'name': 'newL9'}

Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'neovim/nvim-lspconfig'
Plug 'nanotech/jellybeans.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'fholgado/minibufexpl.vim'
"Plug 'scrooloose/nerdcommenter'
"Plug 'ervandew/supertab'
"Plug 'majutsushi/tagbar'
"Plug 'wesQ3/vim-windowswap'
"Plug 'godlygeek/tabular'
"Plug 'rking/ag.vim'
"Plug 'universal-ctags/ctags'
"Plug 'junegunn/goyo.vim'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'tpope/vim-fugitive'
"Plug 'vim-scripts/cscope.vim'
"Plug 'simplyzhao/cscope_maps.vim'

" end plugins
call plug#end()

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
set shiftround                  " round indent to multiple of shiftwidth
set autoindent                  " copy indent from current line, over to the new line

set tabstop=4                   " an indentation every 4 columns
set softtabstop=4               " let backspace delete indent
set shiftwidth=4                " use indent of 4 spaces
"set textwidth=90                " set the textwidth to be 80 chars

set ignorecase                          " case insensitive search
set wildmenu                            " show list instead of just completing
set wildmode=list:longest,full          " change tab completion to be like Bash's
set wildignore=*.o,*.obj,*~,*.swp,*.pyc " files to ignore on auto complete
set showcmd                             " show commands
set incsearch                           " find as you type search
set hlsearch                            " highlight search terms
set smartcase                           " auto switch to case-sensitive
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

" https://robots.thoughtbot.com/faster-grepping-in-vim

" bind K to grep word under cursor
"nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"nnoremap K :exe 'Ag!' expand('<cword>')<cr>

"""""""""""""""""Taglist settings"""""""""""""""""
" https://www.programering.com/a/MDMyQTNwATA.html
let Tlist_Auto_Open = 1
let Tlist_Ctags_Cmd = '~/tools/ctags/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1

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

" https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen
" z<CR> or zt - puts current line to top of screen
" zz          - puts line to center of screen
" zb          - puts current line to bottom of screen

" map leader zz to toggle scroll on/off
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
" sudo apt install silversearcher-ag
nnoremap <Leader><Leader>q :Ag<SPACE>
"        <leader><leader>w :easymotion
nnoremap <Leader><Leader>u :TlistToggle<CR>
nnoremap <Leader><Leader>i :MBEToggle<CR>
nnoremap <Leader><Leader>o :NERDTreeToggle<CR>
nnoremap <Leader><Leader>p :CtrlP<CR>
nnoremap <Leader><Leader>l :CtrlPBuffer<CR>
"nmap <C-k7> :e buffer 
" hold down Ctrl and hjkl
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" window resizing
nmap <s-k> <c-w>-
nmap <s-j> <c-w>+
nmap <s-l> <c-w>5<
nmap <s-h> <c-w>5>
"nmap <s-m> <c-w>_         " max current window horizontally
" this is bad, stops s-n working for search
"nmap <s-n> <c-w>|         " max current window vertically

nmap <c-u> <c-r>          " remap redo. undo = u, redo = U
"nnoremap <c-\> <c-]>
"nnoremap <c-]> <c-t>

nnoremap <F1> :set hlsearch!<CR>

" $ yank until end of line in visual mode
vmap $ g_

" Y yanks to clipboard
vnoremap Y "+y

" P prints from clipboard
nnoremap P "+gP

" & yank to end of line in normal mode
"nnoremap & yg_

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

" clean up white space and save cursor position
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun


" File type dependent options
if has("autocmd")
    " Enable file type detection, plugins, and indentation rules.
    " filetype plugin indent on
    " ... other file types set here ...

    autocmd FileType c,cpp,java,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
    " Python indent.
    " autocmd FileType python setl sw=2 ts=2 sts=2 et
    " autocmd FileType cpp,groovy, java, python setl sw=4 sts=4 et
    " ... other file types set here ...

    " When editing a file, always jump to the last known cursor position.
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \       execute "normal g`\"" |
        \ endif
endif
