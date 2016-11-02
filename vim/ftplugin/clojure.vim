augroup clojure
    autocmd!
    autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry
augroup end
