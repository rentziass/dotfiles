function! s:small_terminal() abort
  new
  wincmd J
  call nvim_win_set_height(0, 12)
  set winfixheight
  term
endfunction

" ANKI: Make a small terminal at the bottom of the screen.
nnoremap <C-t> :call <SID>small_terminal()<CR>
