function! blueprint#Indent()
  let l:previous_non_blank_line_number = prevnonblank(v:lnum - 1)
  let l:indentation = indent(l:previous_non_blank_line_number)
  if l:indentation < 0
    return -1
  endif
  let l:shiftwidth = shiftwidth()
  " If the previous line ended with "[" or "{", increase indentation.
  let l:line = getline(l:previous_non_blank_line_number)
  if l:line =~# '[[{]\s*$'
    let l:indentation += l:shiftwidth
  endif
  " If the current line starts with "]" or "}" , decrease indentation.
  let l:line = getline(v:lnum)
  if l:line =~# '^\s*[\]}]'
    let l:indentation -= l:shiftwidth
  endif
  return l:indentation
endfunction
