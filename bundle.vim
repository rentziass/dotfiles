set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go', {'tag': 'v1.24'}
Plug 'uarun/vim-protobuf'
Plug 'honza/vim-snippets'
Plug 'jparise/vim-graphql'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'pwntester/octo.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

"" Useful defaults
Plug 'tpope/vim-sensible'
"" Alternate between relative and absolute line numbers
Plug 'myusuf3/numbers.vim'
"" Automatically close parenthesis
Plug 'jiangmiao/auto-pairs'

"" Copy link to selected text in Github with ghc
Plug 'danishprakash/vim-githubinator'

Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

call plug#end()

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown'}]

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <leader>fb <cmd>Telescope git_branches<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Octo.nvim
nnoremap <leader>pr <cmd>Octo pr list<cr>

" NvimTree
nnoremap <leader>nt :NvimTreeToggle<CR>
nnoremap <leader>nr :NvimTreeRefresh<CR>
nnoremap <leader>nf :NvimTreeFindFile<CR>

nnoremap <silent> <Leader>m :make build<CR>

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" go
let g:syntastic_go_checkers = ['golint', 'govet', 'golangci-lint']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:go_list_type = "quickfix"
let g:go_rename_command = 'gopls'
autocmd Filetype go setlocal tabstop=2
au FileType go let maplocalleader=" "
au FileType go nmap <LocalLeader>a <Plug>(go-alternate-edit)
au FileType go nmap <LocalLeader>r <Plug>(go-referrers)
au FileType go nmap <LocalLeader>m <Plug>(go-build)
au FileType go nmap <LocalLeader>t <Plug>(go-test)
au FileType go nmap <LocalLeader>c <Plug>(go-coverage)
au FileType go nmap <LocalLeader>ds <Plug>(go-def-split)
au FileType go nmap <LocalLeader>dv <Plug>(go-def-vertical)
au FileType go nmap <LocalLeader>dt <Plug>(go-def-tab)
au FileType go nmap <LocalLeader>gd <Plug>(go-doc)
au FileType go nmap <LocalLeader>gv <Plug>(go-doc-vertical)
au FileType go nmap <LocalLeader>gb <Plug>(go-doc-browser)
au FileType go nmap <LocalLeader>i <Plug>(go-info)
au FileType go nmap <LocalLeader>gr <Plug>(go-rename)
au FileType go nmap <LocalLeader>l <Plug>(go-metalinter)
au FileType go nmap <LocalLeader>ct <Plug>(go-test-compile)
au FileType go nmap <LocalLeader>h <Plug>(go-test-func)
au FileType go setlocal ts=8 sw=8 noet nolist
" au FileType go setlocal foldmethod=syntax
" au FileType go setlocal foldlevelstart=100
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=v:true
let g:go_imports_mode = "gopls"
let g:go_imports_autosave = 1

let g:go_term_enabled = 0
let g:go_term_mode = "split"
let g:go_def_mode = 'gopls'
let g:go_metalinter_deadline = "10s"
let g:go_fmt_options = {
  \ 'gofmt': '-s',
  \ 'goimports': '-local github.com/utilitywarehouse',
  \ 'gofumports': '-local github.com/utilitywarehouse',
  \ }
" autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

colorscheme base16-default-dark
