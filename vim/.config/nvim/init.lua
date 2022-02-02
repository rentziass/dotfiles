--                 _       _
--                | |     (_)
--  _ __ ___ _ __ | |_ _____  __ _ ___ ___
-- | '__/ _ \ '_ \| __|_  / |/ _` / __/ __|
-- | | |  __/ | | | |_ / /| | (_| \__ \__ \
-- |_|  \___|_| |_|\__/___|_|\__,_|___/___/

require('rentziass.utils')
require('rentziass.plugins')
require('rentziass.lsp')

-- to become a require once general.vim is converted to lua too
vim.cmd('source ~/.config/nvim/general.vim')

vim.cmd([[
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
]])

vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')


-- Snippets key bindings
vim.api.nvim_set_keymap('i', '<C-j>', "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", {
  silent = true,
  expr = true,
})

vim.api.nvim_set_keymap('s', '<C-j>', "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", {
  silent = true,
  expr = true,
})
