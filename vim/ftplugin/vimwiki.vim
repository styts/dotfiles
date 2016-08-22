setlocal foldlevel=9     " open all folds

augroup ftplugin_vimwiki
    autocmd!
    au BufNewFile,BufRead *.wiki setfiletype vimwiki
    au BufNewFile *.wiki read!python ~/.vim/ftplugin/diary_template.py <afile>
    au BufNewFile *.wiki normal ggdd  " delete the first blank line
augroup END
