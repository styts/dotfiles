setlocal foldlevel=9     " open all folds

augroup ftplugin_vimwiki
    autocmd!
    au BufNewFile *.wiki silent read!python ~/.vim/ftplugin/diary_template.py <afile>
    au BufNewFile *.wiki silent normal ggdd  " delete the first blank line
augroup END
