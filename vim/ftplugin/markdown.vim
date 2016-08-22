let g:vim_markdown_folding_disabled=0
let g:markdown_fenced_languages = ['python']

augroup ftplugin_markdown
    autocmd!
    au BufEnter *.md nnoremap <localleader>p :!markdown %:p > /tmp/markdown.html && open /tmp/markdown.html<CR>
augroup END
