setlocal foldlevel=9     " open all folds

fun! ReadDailyTemplate(afile)
    read ! python2 ~/.vim/ftplugin/diary_template.py a:afile
    normal ggdd
endf

" this still does not work for some reason. will use the custom command below
" for now.
"augroup ftpluginVimwiki
    "autocmd!
    "autocmd BufNewFile *.wiki MaybeTemplate(expand('<afile>:p'))
"augroup END
"autocmd BufNewFile *.wiki ReadDailyTemplate(expand('<afile>:p'))

command! DiaryTemplate silent call ReadDailyTemplate(expand('%'))
