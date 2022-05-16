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

-- AUTO FORMATTING
auto_formatting_group = vim.api.nvim_create_augroup("AutoFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go", "*.rs", "*.lua", "*.ts" },
  callback = function()
    vim.lsp.buf.formatting()
  end,
  group = auto_formatting_group,
})

-- Go specific autocmds
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function ()
    GoImports(1000)
  end,
  group = auto_formatting_group,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "go",
--   callback = function ()
--     vim.opt_local.ts = 2
--     vim.opt_local.sw = 2
--     vim.opt_local.noet = true
--     vim.opt_local.nolist = true
--     vim.opt_local.tabstop = true
--   end
-- })


vim.cmd([[
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
