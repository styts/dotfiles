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
set colorcolumn=79              " visually limit text length
set smartcase                   " search case-sensitive if term includes uppercase letters
set nobackup                    " Don't create backup files in same folder
set noswapfile
set hidden                      " allows to edit another file without first saving current one
set viminfo+=n~/.vim/viminfo


" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"nerdtree-git-plugin conflicts with python-mode: gives this: Undefined variable: b:pymode_modified
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'cyplo/vim-colors-solarized'
Plugin 'dbeniamine/todo.txt-vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'gerw/vim-HiLinkTrace'
Plugin 'gmarik/Vundle.vim'
Plugin 'henrik/vim-indexed-search'
Plugin 'honza/vim-snippets'
Plugin 'hylang/vim-hy'
Plugin 'ivanov/vim-ipython'
Plugin 'jceb/vim-orgmode'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim.git'
Plugin 'klen/python-mode'
Plugin 'nvie/vim-flake8'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'skammer/vim-css-color'
Plugin 'suan/vim-instant-markdown'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/SyntaxAttr.vim'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-scripts/django.vim'
Plugin 'vim-scripts/openscad.vim'
Plugin 'vim-scripts/paredit.vim'
Plugin 'vim-scripts/rtorrent-syntax-file'
Plugin 'vim-scripts/nc.vim--Eno'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'milkypostman/vim-togglelist'

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
map <Leader>h :set hlsearch!<CR>

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

" open current window in new tab
map <C-T> <C-W>T

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

" colorscheme
if $DARK == "1"
    set background=dark
    let solarized_termtrans=0
    colorscheme solarized
else
    set background=light
    colorscheme base16-default
endif
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
"au Syntax * RainbowParenthesesLoadBraces
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
let g:nerdtree_tabs_open_on_console_startup = 0
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
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'  " faster!

" Pymode
let g:pymode_warnings = 0
let g:pymode_rope = 1 
let g:pymode_lint = 1
let g:pymode_doc = 0  " don't look up documentation - i seem to trigger it involuntarily some times
let g:pymode_rope_goto_definition_bind = '<Leader>j'
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_autoimport = 0
let g:pymode_lint_checkers = ['flake8', 'flake8-pep257']
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
let g:syntastic_python_checkers=[]  " we're using flake8 for python

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
let g:UltiSnipsListSnippets="<C-tab>"

nmap <Leader>z [s1z=<c-o>

:let maplocalleader = "\\"

autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter=1

" wordwrapping in org mode
autocmd FileType org setlocal wrap "true"
autocmd FileType org setlocal linebreak "true"
"autocmd FileType org :OrgToggleFoldingReverse

" git gutter
let g:gitgutter_max_signs = 15000

let g:instant_markdown_slow = 1

" yank ring show
nnoremap <F10> :YRShow<CR> 
let g:yankring_replace_n_pkey='' "yankring should not conflict with CtrlP
let g:yankring_history_dir = '/tmp' " don't want it in home dir

" yank current filename
noremap <silent> <F4> :let @+=expand("%:p")<CR>

" show yankring
noremap <Leader>y :YRShow<CR>

" fugitive git bindings, more here:
" https://www.reddit.com/r/vim/comments/21f4gm/best_workflow_when_using_fugitive/
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gp :Dispatch! git push<CR>
nnoremap <Leader>gl :Dispatch! git pull<CR>

" Gcode
au FileType gcode set syntax nc

" mapping for :Ag
nnoremap <leader>a :Ag<Space>
let g:ag_prg="ag --vimgrep"

" Identify the syntax highlighting group used at the cursor
map <F5> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" quick fix toggle
let g:toggle_list_no_mappings = 1 " don't remap my <Leader>q
nmap <script> <silent> cc :call ToggleQuickfixList()<CR><C-w>j
