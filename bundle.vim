set nocompatible              " be iMproved, required
filetype off                  " required

set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim
" Required:
if dein#load_state('~/.config/dein')
  call dein#begin('~/.config/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.config/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('neoclide/coc.nvim', {'branch': 'release'})
  call dein#add('chriskempson/base16-vim.git')
  call dein#add('tpope/vim-fugitive.git')
  call dein#add('scrooloose/nerdcommenter.git')
  call dein#add('pivotal/tmux-config.git')
  call dein#add('bling/vim-airline.git')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-surround.git')
  call dein#add('Shougo/denite.nvim.git')
  call dein#add('scrooloose/nerdtree.git')
  call dein#add('fatih/vim-go', {'branch': 'master'})
  call dein#config('go.vim', {
        \ 'lazy': 1, 'on_event': 'InsertEnter',
        \})
  call dein#add('uarun/vim-protobuf')
  call dein#config('vim-protobuf.vim', {
        \ 'lazy': 1, 'on_event': 'InsertEnter',
        \ })
  call dein#add('dense-analysis/ale')

  " Useful defaults
  call dein#add('tpope/vim-sensible')
  " iTerm integration, save on focus lost
  call dein#add('sjl/vitality.vim')
  " Awesome fuzzy finder
  call dein#add('kien/ctrlp.vim')
  " Alternate between relative and absolute line numbers
  call dein#add('myusuf3/numbers.vim')
  " Automatically close parenthesis
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('danishprakash/vim-githubinator')
endif

" CoC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" NERDTree
let NERDTreeChDirMode=2
nnoremap <Leader>n :NERDTreeToggle<Enter>

nnoremap <Leader>t i<C-v>u2713<esc>
nnoremap <silent> <Leader>m :make build<CR>

" ALE:
let g:ale_linters = {
      \ 'python': ['flake8', 'pylint'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tsserver', 'tslint'],
      \ 'vue': ['eslint'],
      \ 'terraform': ['terraform'],
      \ 'graphql': ['gqlint'],
      \ 'yaml': ['yamllint'],
      \ 'go': ['golangci-lint', 'gopls'],
\}

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
au FileType go nmap <LocalLeader>s <Plug>(go-implements)
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
"let g:go_snippet_engine = "neosnippet"
let g:go_fmt_command = "goimports"
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
