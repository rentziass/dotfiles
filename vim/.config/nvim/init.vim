set nocompatible              " be iMproved, required
filetype off                  " required

let s:editor_root=expand("~/.config/nvim")

lua << EOF
require('plugins')
require('lsp')
EOF

source ~/.config/nvim/general.vim

augroup GoFormatting
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua GoImports(1000)
augroup END

augroup RustFormatting
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting()
augroup END

augroup LuaFormatting
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting()
augroup END

autocmd FileType go setlocal ts=2 sw=2 noet nolist
autocmd Filetype go setlocal tabstop=2

set background=dark
colorscheme gruvbox

" Snippets
imap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'

" Completion
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

