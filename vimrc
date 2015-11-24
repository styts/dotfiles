" vim:foldmethod=marker:

" {{{ 1 important
set nocompatible
scriptencoding utf-8
set pastetoggle=<F2>
" }}}
" {{{ 2 moving around, searching and patterns
set incsearch                   " Find as you type search
set ignorecase                  " Case insensitive search
set smartcase                   " search case-sensitive if term includes uppercase letters
noremap <Space>h :set hlsearch!<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" }}}
" {{{ 3 tags
" }}}
" {{{ 4 displaying text
set norelativenumber
set number
set numberwidth=4
set nowrap                      " Do not wrap long lines
set scrolloff=9999              " keep current line in the middle of the screen
" }}}
" {{{ 5 syntax, highlighting and spelling
set hlsearch                    " Highlight search terms
set colorcolumn=79              " visually limit text length
set spell
" }}}
" {{{ 6 multiple windows
set hidden                      " allows to edit another file without first saving current one
set splitright
set splitbelow
set laststatus=2                " fix airline issue #20
map <C-J> <C-W>j<C-W>=
map <C-K> <C-W>k<C-W>=
map <C-L> <C-W>l<C-W>=
map <C-H> <C-W>h<C-W>=
nnoremap <Leader>= <C-w>=<CR>   " equalize windows
" }}}
" {{{ 7 multiple tab pages
map <C-T> <C-W>T " open current window in new tab
" gt / tg tab navigation
nnoremap tg gT
" }}}
" {{{ 8 terminal
" }}}
" {{{ 9 using the mouse
set mouse=a
set mousehide
" }}}
" {{{ 10 printing
" }}}
" {{{ 11 messages and info
set shortmess+=I " no Uganda children intro
" }}}
" {{{ 12 selecting text
set clipboard=unnamed
" }}}
" {{{ 13 editing text
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
" }}}
" {{{ 14 tabs and indenting
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
" }}}
" {{{ 15 folding
set nofoldenable              " Folds are annoying
set foldmethod=syntax
nnoremap zO zczO
" }}}
" {{{ 16 diff mode
" }}}
" {{{ 17 mapping
" }}}
" {{{ 18 reading and writing files
set nobackup                    " Don't create backup files in same folder
set nowritebackup
" }}}
" {{{ 19 the swap file
set noswapfile
" }}}
" {{{ 20 command line editing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest commonart, then all.
set wildmenu                    " Show list instead of just completing
set history=1000
set undodir=~/.vim/undo
set undofile                " persistent undo ...

" common command typos
cabbrev Q q
cabbrev W w
cabbrev X x
if has("user_commands")
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif
" }}}
" {{{ 21 executing external commands
" }}}
" {{{ 22 running make and jumping to errors
" }}}
" {{{ 23 language specific
" }}}
" {{{ 24 multi-byte characters
" }}}
" {{{ 25 various
set viminfo+=n~/.vim/viminfo
set hidden                      " allows to edit another file without first saving current one
set viewoptions=cursor,folds,slash,unix
" }}}

" {{{ Filetypes
au BufRead,BufNewFile Vagrantfile set filetype=ruby
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
au FileType gcode set syntax nc
let g:vim_markdown_folding_disabled=0

" wordwrapping in org mode
autocmd FileType org setlocal wrap "true"
autocmd FileType org setlocal linebreak "true"
" }}}

" {{{ Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'SirVer/ultisnips'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-tmux-navigator'
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
Plugin 'milkypostman/vim-togglelist'
Plugin 'nelstrom/vim-markdown-folding'
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
Plugin 'vim-scripts/let-modeline.vim'
Plugin 'vim-scripts/nc.vim--Eno'
Plugin 'vim-scripts/openscad.vim'
Plugin 'vim-scripts/paredit.vim'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'vim-scripts/rtorrent-syntax-file'
Plugin 'vim-scripts/vimwiki.git'

call vundle#end()
filetype plugin indent on
syntax on  " after  vundle#end , as workaround for ultisnips
" }}}

" {{{ Graphics
" colorscheme
if $DARK == "1"
    set background=dark
    let solarized_termtrans=0
    colorscheme solarized
else
    set background=light
    colorscheme base16-default
endif
" Identify the syntax highlighting group used at the cursor
map <F5> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}

" {{{ Mappings
let mapleader=" "
let maplocalleader = "\\"

" map common leader stuff
map <Leader>w :w<CR>
map <Leader>q :bdelete<CR>
map <Leader>x :x<CR>

" edit .vimrc
map <Leader>v :e ~/.dotfiles/vimrc<CR>
map <Leader>V :source ~/.vimrc<CR>

" save file as root
cmap w!! w !sudo tee > /dev/null %

" correct previous misspelled word
nmap <Leader>z [s1z=<c-o>

" yank current filename
noremap <silent> <F4> :let @+=expand("%:p")<CR>

" }}}

" {{{ Plugin: Rainbow parentheses
map <Leader>r :RainbowParenthesesToggle<CR>
au VimEnter * RainbowParenthesesToggle
let braces_blacklist = ['wiki', 'vimwiki']
autocmd Syntax * if index(braces_blacklist, &ft) < 0 | RainbowParenthesesLoadSquare
autocmd Syntax * if index(braces_blacklist, &ft) < 0 | RainbowParenthesesLoadBraces
autocmd Syntax * if index(braces_blacklist, &ft) < 0 | RainbowParenthesesLoadRound
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}
" }}}
" {{{ Plugin: NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup = 1
autocmd VimEnter * NERDTree | wincmd p  " focus on main window
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore=['\.DS_Store$', '.ropeproject', '\.pyc', '\~$', '\.swo$', '__pycache__']
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>f :NERDTreeFind<CR>
" }}}
" {{{ Plugin: NERDCommenter
let g:NERDCustomDelimiters = {'python': {'left': '# '}}
" }}}
" {{{ Plugin: CtrlP
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'  " faster!
" }}}
" {{{ Plugin: Pymode
let g:pymode_warnings = 0
let g:pymode_rope = 1 
let g:pymode_lint = 0
let g:pymode_doc = 0  " don't look up documentation - i seem to trigger it involuntarily some times
let g:pymode_rope_goto_definition_bind = '<Leader>j'
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_autoimport = 0
let g:pymode_lint_checkers = []
let g:pymode_rope_regenerate_on_write = 0
nnoremap <Leader>j <c-c>g<CR>
" }}}
" {{{ Plugin: Surround
vmap s S
" }}}
" {{{ Plugin: Airline
let g:airline_powerline_fonts = 1  " use powerline fonts
" }}}
" {{{ Plugin: Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers=['flake8', 'flake8-pep257']  " we're using flake8 for python
" }}}
" {{{ Plugin: vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}
" {{{ Plugin: Ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<Leader><tab>"
" }}}
" {{{ Plugin: Flake8
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter=1
" }}}
" {{{ Plugin: git gutter
let g:gitgutter_max_signs = 15000
" }}}
" {{{ Plugin: instant markdown 
let g:instant_markdown_slow = 1
" }}}
" {{{ Plugin: yank ring
nnoremap <F10> :YRShow<CR> 
let g:yankring_replace_n_pkey='' "yankring should not conflict with CtrlP
let g:yankring_history_dir = '/tmp' " don't want it in home dir
noremap <Leader>y :YRShow<CR> " show yankring
" }}}
" {{{ Plugin: fugitive
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
" }}}
" {{{ Plugin: Ag.vim
nnoremap <leader>a :Ag<Space>
let g:ag_prg="ag --vimgrep"
" }}}
" {{{ Plugin: vim-togglelist
" (quick fix toggle)
let g:toggle_list_no_mappings = 1 " don't remap my <Leader>q
nmap <script> <silent> cc :call ToggleQuickfixList()<CR><C-w>j
" }}}
" {{{ Plugin: vimwiki
let g:vimwiki_list = [{'path': '~/Personal/vimwiki/',
                     \ 'nested_syntaxes': {'python': 'python', 'sql': 'sql', 'shell': 'zsh'}}]
let g:vimwiki_folding='expr'
" alternatively put on top of file: %% VIM: let g:vimwiki_folding="list"
" }}}
