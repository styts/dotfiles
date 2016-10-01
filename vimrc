" {{{ Vim Options

" top-options
set nocompatible
scriptencoding utf-8
let mapleader=" "

set autoindent                  " Indent at the same level of the previous line
set clipboard^=unnamed  " prepend the unnamed register "
set colorcolumn=79              " visually limit text length
set expandtab                   " Tabs are spaces, not tabs
set foldlevel=0
set foldmethod=syntax
set hidden                      " allows to edit another file without first saving current one
set hidden                      " allows to edit another file without first saving current one
set history=1000
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set incsearch                   " Find as you type search
set laststatus=2                " fix airline issue #20
set mouse=a
set mousehide
set nobackup                    " Don't create backup files in same folder
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set norelativenumber
set noswapfile
set nowrap                      " Do not wrap long lines
set nowritebackup
set number
set numberwidth=4
set pastetoggle=<F2>            " toggle paste mode key
set scrolloff=9999              " keep current line in the middle of the screen
set shiftwidth=4                " Use indents of 4 spaces
set shortmess+=I " no Uganda children intro
set smartcase                   " search case-sensitive if term includes uppercase letters
set softtabstop=0               " Let backspace delete indent
set spell
set splitbelow
set splitright
set tabstop=4                   " An indentation every four columns
set undodir=~/.vim/undo
set undofile                " persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
set viewoptions=cursor,folds,slash,unix
set viminfo='1000,f1
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest commonart, then all.
" shada is viminfo for neovim. the file format for them is different, hence they can't use the same files
if exists("&shada")
    set shada+=n~/.nvim/viminfo
endif
" }}}
" {{{ Autocommands
au BufWritePost *.scad.py silent !python <afile> > <afile>_output.scad
au BufNewFile,BufRead *.de.txt,*.de setfiletype german
au BufNewFile,BufRead *.js.ejs setfiletype javascript
" }}}
" {{{ Plugins
call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-obsession'
" ^^^ required by others, don't sort
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'cyplo/vim-colors-solarized'
Plug 'Chiel92/vim-autoformat'
Plug 'davidhalter/jedi-vim'
Plug 'dbeniamine/todo.txt-vim'
Plug 'dhruvasagar/vim-prosession' | Plug 'tpope/vim-obsession'
Plug 'digitaltoad/vim-pug'
Plug 'ekalinin/Dockerfile.vim'
Plug 'gerw/vim-HiLinkTrace'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'hdima/python-syntax'
Plug 'henrik/vim-indexed-search'
Plug 'hylang/vim-hy'
Plug 'ivanov/vim-ipython'
Plug 'janko-m/vim-test'
Plug 'jceb/vim-orgmode'
Plug 'jelera/vim-javascript-syntax'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jiangmiao/auto-pairs'
Plug 'leafgarland/typescript-vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'kien/rainbow_parentheses.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'nelstrom/vim-markdown-folding'
Plug 'nvie/vim-flake8'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'plasticboy/vim-markdown'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-expand-region'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-salve'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'vim-scripts/django.vim'
Plug 'vim-scripts/let-modeline.vim'
Plug 'vim-scripts/nc.vim--Eno'
Plug 'vim-scripts/openscad.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'vim-scripts/restore_view.vim'
Plug 'vim-scripts/rtorrent-syntax-file'
Plug 'vim-scripts/tracwiki'
Plug '~/.vim/personal'
call plug#end()

" colorscheme needs to be loaded in a plugin, hence it's set after the plugins
" colorscheme/background, decide between dark and light
if $DARK == "1"
    let solarized_termtrans=0
    set background=dark
else
    set background=light
endif
colorscheme solarized

" }}}
" {{{ Mappings
let maplocalleader = "\\"

" map common leader stuff
map <Leader>w :w<CR>
map <Leader>q :q<CR>
map <Leader>x :x<CR>

" edit .vimrc
map <Leader>v :vsp ~/.dotfiles/vimrc<CR>
map <Leader>V :source ~/.vimrc<CR>

" save file as root
cmap w!! w !sudo tee > /dev/null %

" correct previous misspelled word
nnoremap <Leader>z [s1z=<c-o>

" yank current filename
noremap <silent> <F4> :let @+=expand("%:p")<CR>

" german/english spelling
nnoremap <Leader>de :setlocal spell spelllang=de_de<CR>
nnoremap <Leader>en :setlocal spell spelllang=en<CR>

cabbrev Q q
cabbrev W w
cabbrev X x

" Identify the syntax highlighting group used at the cursor
nnoremap <F6> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nnoremap <C-H> <C-W>h<C-W>=
nnoremap <C-J> <C-W>j<C-W>=
nnoremap <C-K> <C-W>k<C-W>=
nnoremap <C-L> <C-W>l<C-W>=

nnoremap <C-T> <C-W>T " open current window in new tab

nnoremap <Leader>0 :set foldlevel=0<CR>
nnoremap <Leader>1 :set foldlevel=1<CR>
nnoremap <Leader>2 :set foldlevel=2<CR>
nnoremap <Leader>3 :set foldlevel=3<CR>
nnoremap <Leader>4 :set foldlevel=4<CR>
nnoremap <Leader>5 :set foldlevel=5<CR>
nnoremap <Leader>6 :set foldlevel=6<CR>
nnoremap <Leader>7 :set foldlevel=7<CR>
nnoremap <Leader>8 :set foldlevel=8<CR>
nnoremap <Leader>9 :set foldlevel=9<CR>

nnoremap <Leader>= <C-w>=<CR>   " equalize windows

nnoremap tg gT
nnoremap zO zczO

noremap <Space>h :set hlsearch!<CR>

noremap j gj
noremap k gk

vnoremap < <gv
vnoremap > >gv

if has("user_commands")
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif
" }}}
" {{{ Commands
command! FileType execute 'vsplit ~/.vim/ftplugin/' . &ft . '.vim'
" }}}
" {{{ Plugin Settings
" {{{ Plugin: Rainbow parentheses
"map <Leader>r :RainbowParenthesesToggle<CR>
"au VimEnter * RainbowParenthesesToggle
let braces_blacklist = ['wiki', 'vimwiki', 'htmldjango', 'css']
autocmd Syntax * if index(braces_blacklist, &ft) < 0 | RainbowParenthesesLoadSquare
autocmd Syntax * if index(braces_blacklist, &ft) < 0 | RainbowParenthesesLoadBraces
autocmd Syntax * if index(braces_blacklist, &ft) < 0 | RainbowParenthesesLoadRound
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['red',         'firebrick3'],
    \ ]
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
    \       }
    \   }
    \}
" }}}
" {{{ Plugin: NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup = 0
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
let g:ctrlp_extensions = []
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'  " faster!
" }}}
" {{{ Plugin: Pymode
" NOTE: plan to replace this with Jedi
let g:pymode = 0
let g:pymode_warnings = 0
let g:pymode_rope = 0
let g:pymode_lint = 0
"let g:pymode_doc = 0  " don't look up documentation - i seem to trigger it involuntarily some times  (this does not help)
let g:pymode_rope_goto_definition_bind = '<Leader>j'
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_autoimport = 1
let g:pymode_lint_checkers = []
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_options_max_line_length = 79
" }}}
" {{{ Plugin: Jedi
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_on_dot = 0
let g:jedi#goto_definitions_command = "<Leader>j"
let g:jedi#usages_command = ""
" }}}
" {{{ Plugin: Surround
vmap s S
" }}}
" {{{ Plugin: Airline
"let g:airline_left_sep=''
let g:airline_theme='solarized'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts = 1  " use powerline fonts
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'z', 'warning' ]
    \ ]

" }}}
" {{{ Plugin: Syntastic
let g:syntastic_debug = 0 " toggle this
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers=['flake8', 'flake8-pep257']  " we're using flake8 for python
let g:syntastic_filetype_map = { "german": "text" }
let g:syntastic_enable_html_checker = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_javascript_checker = 1
"let g:syntastic_text_checkers = ['language_check']
"let g:syntastic_text_language_check_args = '--language=de-DE'
" }}}
" {{{ Plugin: vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}
" {{{ Plugin: Ultisnip
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets="<Leader><tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/Personal/UltiSnips"
let g:UltiSnipsUsePythonVersion = 2
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
nnoremap <script> <silent> cc :call ToggleQuickfixList()<CR><C-w>j
" }}}
" {{{ Plugin: vimwiki
let g:vimwiki_list = [{'path': '~/Personal/vimwiki/',
                     \ 'nested_syntaxes': {'python': 'python',
                     \'sql': 'sql',
                     \'german': 'german',
                     \'shell': 'zsh'}}]
let g:vimwiki_folding='expr'
:let g:vimwiki_table_mappings=0
" alternatively put on top of file: %% VIM: let g:vimwiki_folding="list"
" }}}
" {{{ Plugin: YouCompleteMe
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" }}}
" {{{ Plugin: vim-test
let test#strategy = 'neovim'
"let g:test#preserve_screen = 1
let test#python#runner = 'pytest'
"let test#python#pytest#options = '-q'
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
"nmap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>l :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>
" }}}
" }}}
" Terminal {{{
" ESC to normal mode (this breaks readline behavior)
"tnoremap <Esc> <C-\><C-n> 
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" }}}
" NEW STUFF GOES HERE {{{ "
 
" }}} "
