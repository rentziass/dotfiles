"                 _       _
"                | |     (_)
"  _ __ ___ _ __ | |_ _____  __ _ ___ ___
" | '__/ _ \ '_ \| __|_  / |/ _` / __/ __|
" | | |  __/ | | | |_ / /| | (_| \__ \__ \
" |_|  \___|_| |_|\__/___|_|\__,_|___/___/
"
"

lua << EOF
require('rentziass.plugins')
require('rentziass.lsp')
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

augroup TypescriptFormatting
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting()
augroup END

autocmd FileType go setlocal ts=2 sw=2 noet nolist
autocmd Filetype go setlocal tabstop=2

" set global mark for last edit in insert mode, use `I to jump to this

" no matter what file you're in
autocmd InsertLeave * execute 'normal! mI'

set background=dark
colorscheme gruvbox

" Snippets
imap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
