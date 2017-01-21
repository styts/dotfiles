augroup clojure
    autocmd!
    autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

    nnoremap <Space>aa :execute "normal cpp"<CR> :silent! :Last!<CR>
    " from https://github.com/tpope/vim-fireplace/issues/81
    autocmd BufReadPost /tmp*clj set bufhidden=delete
augroup end
