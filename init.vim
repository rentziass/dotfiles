set nocompatible              " be iMproved, required
filetype off                  " required

if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif

source ~/.config/nvim/general.vim
source ~/.config/nvim/bundle.vim
