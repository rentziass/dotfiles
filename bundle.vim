set nocompatible              " be iMproved, required
filetype off                  " required

" Octo.nvim
nnoremap <leader>pr <cmd>Octo pr list<cr>

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

set background=dark
colorscheme gruvbox
