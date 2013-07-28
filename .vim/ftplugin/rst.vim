function! Rst_makeCurrentLineAsHeader(header_char, with_overline)
  let current_line = getline('.')
  let current_lnum = line('.')
  let current_lcol = col('.')
  let header_line = repeat(a:header_char, len(current_line) + 2)
  call append(current_lnum, header_line)
  if a:with_overline
     call append(current_lnum - 1, header_line)
  endif
  call cursor(current_lnum + 2, current_lcol)
endfunction

function! Rst_adjustHeaderLineLength()
   let current_line = getline('.')
   let current_lnum = line('.')
   let header_char = getline(current_lnum + 1)[0]
   let header_line = repeat(header_char, len(current_line) + 2)
   call setline(current_lnum + 1, header_line)
   if getline(current_lnum - 1)[0] == header_char
      call setline(current_lnum - 1, header_line)
   endif
endfunction

" # with overline, for parts
" " * with overline, for chapters
" " =, for sections
" " -, for subsections
" " ^, for subsubsections
" " ", for paragraphs
map <leader>h# :call Rst_makeCurrentLineAsHeader('#', 1)<cr>
map <leader>h* :call Rst_makeCurrentLineAsHeader('*', 1)<cr>
map <leader>h= :call Rst_makeCurrentLineAsHeader('=', 0)<cr>
map <leader>h- :call Rst_makeCurrentLineAsHeader('-', 0)<cr>
map <leader>h^ :call Rst_makeCurrentLineAsHeader('^', 0)<cr>
map <leader>h" :call Rst_makeCurrentLineAsHeader('"', 0)<cr>

map <leader>hh :call Rst_adjustHeaderLineLength()<cr>
