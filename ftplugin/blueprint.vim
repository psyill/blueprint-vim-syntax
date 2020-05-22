setlocal comments=sr:/*,mb:*,ex:*/,://
setlocal commentstring=//%s
setlocal suffixesadd=.bp
if executable('bpfmt')
  setlocal formatprg=bpfmt\ -o
endif
setlocal formatoptions+=croqj
setlocal foldmethod=syntax
