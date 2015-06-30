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
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest commonart, then all.
set colorcolumn=80              " visually limit text length
set smartcase                   " search case-sensitive if term includes uppercase letters
set nobackup
set noswapfile
set hidden                      " allows to edit another file without first saving current one
set viminfo+=n~/.vim/viminfo


" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'cyplo/vim-colors-solarized'
Plugin 'gmarik/Vundle.vim'
Plugin 'ivanov/vim-ipython'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim.git'
Plugin 'klen/python-mode'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'skammer/vim-css-color'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/paredit.vim'
Plugin 'vim-scripts/openscad.vim'
Plugin 'hylang/vim-hy'
Plugin 'dbeniamine/todo.txt-vim'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-scripts/rtorrent-syntax-file'
Plugin 'vim-scripts/SyntaxAttr.vim'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

" Clipboard
if has('clipboard')
	if has('unnamedplus')  " When possible use + register for copy-paste
	    set clipboard=unnamed
	else         " On mac and Windows, use * register for copy-paste
	    set clipboard=unnamed
	endif
endif

" Undo
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile                " persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif
set directory=$HOME/.vim/swap//
set viewdir=$HOME/.vim/views//

" Space leads the way
let mapleader=" "

" map common leader stuff
map <Leader>w :w<CR>
map <Leader>q :bdelete<CR>
map <Leader>x :x<CR>

" no highlight search
map <Leader>h :set nohlsearch<CR>

" edit .vimrc
map <Leader>v :e ~/.dotfiles/vimrc<CR>
map <Leader>V :source ~/.vimrc<CR>

" split locations
set splitright
set splitbelow

" Easy window navigation
map <C-J> <C-W>j<C-W>=
map <C-K> <C-W>k<C-W>=
map <C-L> <C-W>l<C-W>=
map <C-H> <C-W>h<C-W>=

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" keep current line in the middle of the screen
set scrolloff=9999

" common command typos
cabbrev Q q
cabbrev W w
cabbrev X x
if has("user_commands")
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

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
set background=light
colorscheme base16-default
map <F5> :set background=dark<CR>:let solarized_termtrans=0<CR>:colorscheme base16-default<CR>

" sane pasting
set pastetoggle=<F2>

" equalize windows
nnoremap <Leader>= <C-w>=<CR>

" markdown
au FileType md set filetype=markdown

" gt / tg tab navigation
nnoremap tg gT

" Ruby syntax highlighting for Vagrantfiles
augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

"########### Plugin-specific settings ##############

" Rainbow parentheses
map <Leader>r :RainbowParenthesesToggle<CR>
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 18

" NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore=['\.DS_Store$', '.ropeproject', '\.pyc', '\~$', '\.swo$', '__pycache__']
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>f :NERDTreeFind<CR>

" NERDCommenter
let g:NERDCustomDelimiters = {'python': {'left': '# '}}

" CtrlP
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
"nnoremap <c-o> :CtrlPMRUFiles<CR>

" Pymode
let g:pymode_warnings = 0
let g:pymode_rope = 1 
let g:pymode_doc = 0  " don't look up documentation - i seem to trigger it involuntarily some times
let g:pymode_rope_goto_definition_bind = '<Leader>j'
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_autoimport = 0
let g:pymode_lint_ignore = "E501,W0401"
nnoremap <Leader>j <c-c>g<CR>

" Markdown
let g:vim_markdown_folding_disabled=1

" surround
vmap s S

" airline
let g:airline_powerline_fonts = 1  " use powerline fonts

" save file as root
cmap w!! w !sudo tee > /dev/null %

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E702'

" insert current date
map <Leader>d :r !date<CR> 

" visual expand
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" paste multiple times safely
xnoremap <Leader>p "_dP

" xml folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
" easy folding toggle
"nnoremap zz za
nnoremap zO zczO

" ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-tab>"
