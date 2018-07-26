" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

" set guifont=Source\ Code\ Pro\ for\ Powerline:h18
set guifont=Fira\ Code\ Regular:h18
