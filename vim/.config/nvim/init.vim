set nocompatible              " be iMproved, required
filetype off                  " required

let s:editor_root=expand("~/.config/nvim")

lua << EOF
require('plugins')
require('lsp')
EOF

source ~/.config/nvim/general.vim

augroup GoFormatting
autocmd BufWritePre *.go lua GoImports(1000)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
augroup END

autocmd FileType go setlocal ts=8 sw=8 noet nolist
autocmd Filetype go setlocal tabstop=2

"set background=dark
"colorscheme github-colors

"""""""" Autocompletion
let g:completion_enable_snippet = 'vim-vsnip'
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Ctrl + space to trigger autocompletion
imap <silent> <C-space> <Plug>(completion_trigger)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Jump to next snippet placeholder
imap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
smap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
