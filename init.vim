set nocompatible              " be iMproved, required
filetype off                  " required

let s:editor_root=expand("~/.config/nvim")

lua << EOF
require('plugins')
require('lsp')
EOF

source ~/.config/nvim/bundle.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/coc.vim

augroup GoFormatting
autocmd BufWritePre *.go lua GoImports(1000)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
augroup END
