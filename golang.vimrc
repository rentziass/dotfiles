Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-go'

" hide hidden chars (yeah, right?)
set nolist

" Neosnippet config
let g:go_snippet_engine = "neosnippet"

imap <C-s>     <Plug>(neosnippet_expand_or_jump)
smap <C-s>     <Plug>(neosnippet_expand_or_jump)
xmap <C-s>     <Plug>(neosnippet_expand_target)

if has('nvim')
  " Enable deoplete on startup
  let g:deoplete#enable_at_startup = 1
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_fmt_autosave = 1


" Highlight the same variable
let g:go_auto_sameids = 1

" Auto import dependencies
let g:go_fmt_command = "goimports"

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" See declarations across all package
au FileType go nmap <leader>gt :GoDeclsDir<cr>

" Toggle test coverage
au FileType go nmap <F9> :GoCoverageToggle -short<cr>

" Go to definition
au FileType go nmap <F12> <Plug>(go-def)

" Show variable type in airline
let g:go_auto_type_info = 1

" JSON tags format
let g:go_addtags_transform = "snakecase"
