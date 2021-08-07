set nocompatible              " be iMproved, required
filetype off                  " required

let s:editor_root=expand("~/.config/nvim")

lua << EOF
require('plugins')
require('lsp')
EOF

source ~/.config/nvim/general.vim
source ~/.config/nvim/coc.vim

augroup GoFormatting
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua GoImports(1000)
augroup END

augroup RustFormatting
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting()
augroup END

autocmd FileType go setlocal ts=8 sw=8 noet nolist
autocmd Filetype go setlocal tabstop=2

set background=dark
colorscheme gruvbox
