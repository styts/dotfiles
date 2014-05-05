" General
set nocompatible
syntax on
set mouse=a
set mousehide
scriptencoding utf-8
set history=1000
set spell
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set nofoldenable 	        	" Folds are annoying
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim.git'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'valloric/YouCompleteMe'
Plugin 'rking/ag.vim'
call vundle#end()
filetype plugin indent on

" Clipboard
if has('clipboard')
	if has('unnamedplus')  " When possible use + register for copy-paste
	    set clipboard=unnamedplus
	else         " On mac and Windows, use * register for copy-paste
	    set clipboard=unnamed
	endif
endif

" Backups & Undo
set backup
if has('persistent_undo')
    set undodir=~/.vim/undodir
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif
set backupdir=$HOME/.vimbackup//
set directory=$HOME/.vimswap//
set viewdir=$HOME/.vimviews//

" Space leads the way
let mapleader=" "

" map common leader stuff
map <Leader>w :w<CR>
map <Leader>q :bdelete<CR>
map <Leader>x :x<CR>

" no highlight search
map <Leader>h :set nohlsearch<CR>

" disable folds
set nofoldenable

" edit .vimrc
map <Leader>v :e ~/.vimrc<CR>

" split locations
set splitright
set splitbelow

" Easy window navigation
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" keep current line in the middle of the screen
set scrolloff=9999

" common command typos
cabbrev Q q
cabbrev W w
cabbrev X x
"if has("user_commands")
    "command! -bang -nargs=* -complete=file E e<bang> <args>
    "command! -bang -nargs=* -complete=file W w<bang> <args>
    "command! -bang Q q<bang>
    "command! -bang X x<bang>
"endif

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" enable line numbers
set norelativenumber
set nu

" no Uganda children intro
set shortmess+=I

" visually limit text at 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" colorscheme
set background=dark
colorscheme solarized

set pastetoggle=<Leader>p

"########### Plugin-specific settings ##############

" Rainbow parentheses
map <Leader>r :RainbowParenthesesToggle<CR>
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" NERDTreeTabs
let NERDTreeIgnore=['\.DS_Store$', '.ropeproject', '\.pyc', '\~$', '\.swo$']
"let NERDTreeIgnore += ['\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>f :NERDTreeFind<CR>

" CtrlP
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
